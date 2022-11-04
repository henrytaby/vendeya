<?PHP
namespace App\Sinpreh\Module\ProyectoSeguimiento\Snippet\Fisico;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "proyecto_actividad_seguimiento";
    var $folder = "fisico";
    var $fkey_field = "proyecto_id";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */

    public function getItemDatatableRows($item_id,$filter){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "index";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        $where = $this->get_filtro_where($filter);
        $where = str_replace("p.","i.",$where);
        if($where != ""){
            $where .= " and ";
        }
        $where .= "i.".$this->fkey_field."='".$item_id."' ";
        $extraWhere = $where ;
        //$extraWhere = "i.".$this->fkey_field."='".$item_id."' " ;

        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);


        foreach ($result['data'] as $itemId => $valor) {
            if(isset($result['data'][$itemId]['fecha'] ))$result['data'][$itemId]['fecha'] = $this->changeDataFormat($result['data'][$itemId]['fecha'],"d/m/Y");
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
        $result["recordsTotal"]=$result["recordsFiltered"];
        return $result;
    }

    function get_filtro_where($item){
        $where = "";
        if( isset($item["meta"]) and trim($item["meta"])!="" ){
            $where = " i.proyecto_actividad_id in (".$item["meta"].")  ";
        }

        if( isset($item["filtro_estado"]) and trim($item["filtro_estado"])!="" ){
            if($where == ""){
                $where .= "  ";
            }else{
                $where .= " and ";
            }
            $where .= " p.estado_id in (".$item["filtro_estado"].")  ";
        }

        return $where;
    }


    function updateData($rec,$itemId,$form,$action,$item_id, $input_file){
        //print_struc($_FILES);
        $tabla = $this->table[$this->objTable];
        $itemData  = $this->processData($form,$rec,$action,$item_id);
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
             * Calculamos totales y porcentajes
             */
            $this->updateMeta($item_id);

        }
        return $res;
    }

    function updateMeta($id){
        $sql = "select * from proyecto_actividad as pa where pa.proyecto_id=".$id;
        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        foreach ($item as $row){
            $sql2 = "update proyecto_actividad as pa set avance_total = (select sum(pas.total) from proyecto_actividad_seguimiento as pas where pas.proyecto_actividad_id = pa.id),
                    avance_fisico =  round( ((select sum(pas.total) from proyecto_actividad_seguimiento as pas where pas.proyecto_actividad_id = pa.id) / pa.total) * 100 ,2)
                    where pa.id = ".$row["id"];
            $res = $this->dbm->Execute($sql2);
        }

        /**
         * Actualizamos todos los campos que estan en nulos a 0
         */
        $sql2 = "update proyecto_actividad as pa set avance_fisico = 0 where pa.avance_fisico ISNULL and  pa.proyecto_id=".$id;
        $res = $this->dbm->Execute($sql2);

        $sql2 = "update proyecto_actividad as pa set avance_total = 0 where pa.avance_total ISNULL and  pa.proyecto_id=".$id;
        $res = $this->dbm->Execute($sql2);



        $sql = "update proyecto as p set avance_fisico= (select round(avg(pa.avance_fisico),2) as total from proyecto_actividad  as pa where pa.proyecto_id = p.id)
                where p.id=".$id;
        $item = $this->dbm->Execute($sql);
    }

    function processData($form,$rec,$action="new",$item_id){
        $dataResult = array();
        switch($form){
            case 'index':
                $dataResult = $this->processFields($rec,$this->campos[$form],$action);
                /**
                 * Additional processes when saving the data
                 */
                if ($action=="new"){
                    //$dataResult["activo"] = "true";
                    $dataResult[$this->fkey_field]= $item_id;
                }else{
                    unset($dataResult["proyecto_actividad_id"]);
                }

                break;

        }
        return $dataResult;
    }

    function getItem($id,$item_id){

        $sql = "select * from ".$this->table[$this->objTable]." as p where p.id = '".$id."' and p.".$this->fkey_field." = '".$item_id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }
    function getItemMeta($id,$item_id){
        //$this->dbm->debug = true;
        $sql = "select au.nombre as unidad ,p.* from ".$this->table["proyecto_actividad"]." as p 
                left join ".$this->table["actividad_unidad"]." as au on au.id= p.actividad_unidad_id
                where p.id = '".$id."' and p.".$this->fkey_field." = '".$item_id."' 
        ";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }
    function deleteData($id,$item_id){
        $item = $this->getItem($id,$item_id);
        /**
         * borramos el archivo primero
         */
        $this->deleteAttachmentFile($id,$item_id,$item["attached_extension"],$this->folder);
        /**
         * Delete the record from the database
         */
        $field_id="id";
        $where = $this->fkey_field."='".$item_id."'";
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable],$where);

        /**
         * Calculamos totales y porcentajes
         */
        $this->updateMeta($item_id);

        return $res;
    }

    function getFile($id,$item_id){
        $msg_erro = "<div style='text-align: center;  background-color: #fee7dc;vertical-align: center; padding-top: 50px;padding-bottom: 50px;'><span style='color:red; font-family: Arial;font-size:26px;'>The file does not exists</span></div>";
        $item = $this->getItem($id,$item_id);

        if($item["id"]!=""){
            $dir  = $this->getAttachmentDir($item_id,0,$this->folder);
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
