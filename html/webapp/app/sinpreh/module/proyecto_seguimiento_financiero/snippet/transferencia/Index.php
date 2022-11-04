<?PHP
namespace App\Sinpreh\Module\ProyectoSeguimientoFinanciero\Snippet\Transferencia;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = array();
    var $folder = array();
    var $form = array();
    //var $folder = "financiador";
    var $fkey_field = "proyecto_id";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
        $this->objTable[0] = "proyecto_transferencia_seguimiento";
        $this->objTable[1] = "proyecto_transferencia_devolucion";
        $this->objTable[2] = "proyecto_transferencia_ejecucion";

        $this->form[0] = "index";
        $this->form[1] = "index_01";
        $this->form[2] = "index_02";

        $this->folder[0] = "financiero_transferencia";
        $this->folder[1] = "financiero_devolucion";
        $this->folder[2] = "financiero_ejecucion";
    }
    /**
     * Implementación desde aca
     */

    public function getItemDatatableRows($item_id,$numTable=0){
        global $dbSetting;
        if($numTable=="") $numTable=0;
        $grid = $this->form[$numTable];

        $table = $this->table[$this->objTable[$numTable]];
        $primaryKey = 'id';
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        $extraWhere = "i.".$this->fkey_field."='".$item_id."' " ;
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);
        /**
         * Cambiamos formato de fechas
         */
        foreach ($result['data'] as $itemId => $valor) {
            if(isset($result['data'][$itemId]['fecha']))$result['data'][$itemId]['fecha'] = $this->changeDataFormat($result['data'][$itemId]['fecha'],"d/m/Y");
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
        $result["recordsTotal"]=$result["recordsFiltered"];
        return $result;
    }


    function updateData($rec,$itemId,$action,$item_id,$numTable=0,$input_file){
        if($numTable=="") $numTable=0;
        $form = $this->form[$numTable];

        $tabla = $this->table[$this->objTable[$numTable]];
        $itemData  = $this->processData($form,$rec,$action,$item_id);
        /*
        print_struc($rec);
        print_struc($itemData);
        */
        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$tabla,$action,$field_id);
        $res["accion"] = $action;
        /**
         * Process attachment
         */
        if( $res["res"]==1){
            /**
             * Recalculamos los totales
             */
            $this->updateTotal($item_id);
            /**
             * Guardaremos el archivo adjunto enviado desde el formulario
             */
            $item = $this->getItem($res["id"],$item_id,$numTable);
            $item_id_name = $this->fkey_field;
            $id_name = "id";
            $folder = $this->folder[$numTable];
            $adjunto = $this->saveAttachment($item,$tabla,$input_file,$item_id,$res["id"],$action,$folder,$item_id_name,$id_name);

            /**
             * Actualizamos la ejecución
             */
            if($numTable==2){
                $this->updateTotalMmaya($item_id);
            }

        }
        return $res;
    }

    public function getTotalAvance($id){
        $sql = "select 
            sum(pf.aporte_financiero) as aporte_financiero,
            sum(pf.aporte_nofinanciero) as aporte_nofinanciero,
            (sum(pf.aporte_financiero) + sum(pf.aporte_nofinanciero)) as total,
            sum(pf.porcentaje) as porcentaje,
			sum(pf.total_avance) as total_avance
            from proyecto_financiador as pf 
            where pf.proyecto_id=".$id;
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        $item["avance_financiero"] = ($item["total_avance"] / $item["total"]) *100;
        $item["avance_financiero"] = round($item["avance_financiero"],2);
        return $item;
    }

    function updateTotalAporte($id){
        $total = $this->getTotalAvance($id);
        $rec = array();
        $rec["aporte_financiero"] = $total["aporte_financiero"];
        $rec["aporte_no_financiero"] = $total["aporte_nofinanciero"];
        $rec["aporte_total"] = $total["total"];
        $rec["aporte_porcentaje"] = $total["porcentaje"];
        $rec["avance_financiero"] = $total["avance_financiero"];


        $table = $this->table["proyecto"];
        $where = "id=".$id;
        $resp = $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);
    }


    function updateTotalMmaya($id){
        /**
         * Actualizamos las sumas
         * ---------------------------------------------------------------------------------------
         */
        $sql = "update proyecto_financiador as pf
                set 
                aporte_financiero_avance = (
                    select sum(te.monto) from proyecto_transferencia_ejecucion as te
                    where te.proyecto_financiador_id =pf.id
                )
                where pf.organismo_financiador_id=1 and pf.proyecto_id =".$id;
        $resp = $this->dbm->Execute($sql);
        /**
         * Colocamos en 0 los items que no tienen datos
         * ---------------------------------------------------------------------------------------
         */
        $sql = "update proyecto_financiador as pf
                set 
                aporte_financiero_avance =0
                where pf.organismo_financiador_id=1 
                and pf.aporte_financiero_avance is NULL
                and pf.proyecto_id =".$id;
        $resp = $this->dbm->Execute($sql);



        $sql = "select pf.* from proyecto_financiador as pf where pf.organismo_financiador_id=1 and  pf.proyecto_id = ".$id;
        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        $dato = array();
        foreach ($item as $row){
            $rec = array();

            if($row["aporte_financiero"]==0){
                $rec["aporte_financiero_avance_porcentaje"] = 0;
            }else{
                $rec["aporte_financiero_avance_porcentaje"] = round( (($row["aporte_financiero_avance"]/$row["aporte_financiero"]) * 100),2);
            }

            if($row["aporte_nofinanciero"]==0){
                $rec["aporte_nofinanciero_avance_porcentaje"] = 0;
            }else{
                $rec["aporte_nofinanciero_avance_porcentaje"] =  round( (($row["aporte_nofinanciero_avance"]/$row["aporte_nofinanciero"]) * 100),2);
            }

            $rec["aporte_financiero_saldo"] = $row["aporte_financiero"] - $row["aporte_financiero_avance"];
            $rec["aporte_nofinanciero_saldo"] = $row["aporte_nofinanciero"] - $row["aporte_nofinanciero_avance"];


            $rec["total_aporte"] = $row["aporte_financiero"] + $row["aporte_nofinanciero"];
            $rec["total_avance"] = $row["aporte_financiero_avance"] + $row["aporte_nofinanciero_avance"];


            if($rec["total_aporte"] ==0){
                $rec["total_porcentaje"] =  0;
            }else{
                $rec["total_porcentaje"] =  round( (($rec["total_avance"]/$rec["total_aporte"] ) * 100),2);
            }
            $rec["total_saldo"] = $row["total_aporte"] - $row["total_avance"];

            $where = "id=".$row["id"];
            $resupdate = $this->dbm->AutoExecute("proyecto_financiador",$rec,"UPDATE",$where);
        }

        /**
         * Recalcular los datos de porcentaje de avance
         */
        $this->updateTotalAporte($id);
    }


    function updateTotal($id){

        $sql = "update 
proyecto as p
set mmaya_transferencia = (select sum(ts.monto) as monto
from  proyecto_transferencia_seguimiento as ts 
where ts.proyecto_id=p.id)
,
mmaya_devolucion = (select sum(ts.monto) as monto
from  proyecto_transferencia_devolucion as ts 
where ts.proyecto_id=p.id)
,
mmaya_ejecucion = (select sum(ts.monto) as monto
from  proyecto_transferencia_ejecucion as ts 
where ts.proyecto_id=p.id)
,

ejecucion_financiero =(select sum(ts.monto) as monto
from  proyecto_cofinanciador_ejecucion as ts 
where ts.financiera=TRUE and ts.proyecto_id=p.id)
,
ejecucion_nofinanciero =(select sum(ts.monto) as monto
from  proyecto_cofinanciador_ejecucion as ts 
where ts.financiera=FALSE and ts.proyecto_id=p.id)
where p.id = ".$id;

        $resp = $this->dbm->Execute($sql);
    }


    function processData($form,$rec,$action="new",$item_id){
        //$dataResult = array();
        $dataResult = $this->processFields($rec,$this->campos[$form],$action);
        if ($action=="new") {
            $dataResult[$this->fkey_field]= $item_id;
        }

        switch($form){
            case 'index':
                /**
                 * Additional processes when saving the data
                 */
                break;
            /**
             * Para form 01
             */
            case 'index_01':

                break;
            /**
             * Para form 02
             */
            case 'index_02':
                if ($action=="new") {
                    /**
                     * Sacamos el id del dato del mmaya en entidad
                     */
                    $sql = "select 
                            *
                            from
                            proyecto_financiador pf
                            where pf.organismo_financiador_id=1 and pf.proyecto_id = ".$item_id;
                    $otro = $this->dbm->Execute($sql);
                    $otro = $otro->fields;
                    $dataResult["proyecto_financiador_id"] = $otro["id"];
                }
                break;

        }
        return $dataResult;
    }

    function getItem($id,$item_id,$numTable=0){
        if($numTable=="") $numTable=0;
        $sql = "select * from ".$this->table[$this->objTable[$numTable]]." as p where p.id = '".$id."' and p.".$this->fkey_field." = '".$item_id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    function deleteData($id,$item_id,$numTable=0){
        if($numTable=="") $numTable=0;

        $item = $this->getItem($id,$item_id,$numTable);
        /**
         * Delete the record from the database
         */
        $field_id="id";
        $where = $this->fkey_field."='".$item_id."'";
        $table = $this->table[$this->objTable[$numTable]];
        $res = $this->deleteItem($id,$field_id,$table,$where);

        /**
         * borramos el archivo solo si tiene permisos de borrado y si no ocurrio algun error
         */
        if( $res["res"]==1){
            $folder = $this->folder[$numTable];
            $this->deleteAttachmentFile($id,$item_id,$item["attached_extension"],$folder);
            /**
             * Recalculamos los totales
             */
            $this->updateTotal($item_id);
            if($numTable==2){
                $this->updateTotalMmaya($item_id);
            }
        }

        return $res;
    }

    public function getTotal($id){
        //$this->dbm->debug = true;
        $sql = "select 
            mmaya_transferencia
,   mmaya_devolucion
,   mmaya_ejecucion
,   ejecucion_financiero
,   ejecucion_nofinanciero
,   avance_financiero
            from proyecto as pf 
            where pf.id=".$id;
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;

        if($item["mmaya_transferencia"]=="")$item["mmaya_transferencia"]=0;
        if($item["mmaya_devolucion"]=="")$item["mmaya_devolucion"]=0;
        if($item["mmaya_ejecucion"]=="")$item["mmaya_ejecucion"]=0;

        $item["mmaya_total"] = $item["mmaya_transferencia"] - $item["mmaya_devolucion"];

        $sql = "select 
pf.aporte_financiero
from
proyecto_financiador pf
where pf.organismo_financiador_id=1 and pf.proyecto_id = ".$id;
        $otro = $this->dbm->Execute($sql);
        $otro = $otro->fields;
        if($otro["aporte_financiero"]==""){
            $item["mmaya"]=0;
        }else{
            $item["mmaya"]=$otro["aporte_financiero"];
        }

        $item["mmaya_porcentaje"] = ($item["mmaya_total"] / $item["mmaya"]) *100;

        $item["mmaya_ejecucion_porcentaje"] = ($item["mmaya_ejecucion"] / $item["mmaya_total"]) *100;


        $item["saldo_transferir"] = ($item["mmaya"] - $item["mmaya_total"]) ;
        $item["saldo_cif"] = ($item["mmaya_ejecucion"] / $item["mmaya"]) *100;
        $item["saldo_porejecutar"] = $item["mmaya_total"] - $item["mmaya_ejecucion"];
        $item["mmaya_ejecucion_porcentaje_total"] = ($item["mmaya_ejecucion"] / $item["mmaya"]) *100;


        //print_struc($item);
        return $item;
    }

    function getFile($id,$item_id,$numTable){
        if($numTable=="") $numTable=0;
        $msg_erro = "<div style='text-align: center;  background-color: #fee7dc;vertical-align: center; padding-top: 50px;padding-bottom: 50px;'><span style='color:red; font-family: Arial;font-size:26px;'>The file does not exists</span></div>";
        $item = $this->getItem($id,$item_id,$numTable);

        if($item["id"]!=""){
            $dir  = $this->getAttachmentDir($item_id,0,$this->folder[$numTable]);
            $file = $dir.$id.".".$item["attached_extension"];

            if(file_exists($file)){
                header ("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
                header ("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
                header ("Cache-Control: no-cache, must-revalidate");
                header ("Pragma: no-cache");
                header ("Content-Type:".$item["attached_type"]);
                header ('Content-Disposition: attachment; filename="'.$item["attached_name"].'"');
                header ("Content-Length: " . $item["attached_size"]);
                readfile($file);
                exit;
            }else{
                echo $msg_erro;
            }
        }else{
            echo $msg_erro;
        }
        exit;
    }
}
