<?PHP
namespace App\Sinpreh\Module\ProyectoConvenio\Snippet\Enmienda;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "convenio_enmienda";
    var $folder = "enmienda";
    var $fkey_field = "convenio_id";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */

    public function getItemDatatableRows($item_id){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "index";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        $extraWhere = $this->fkey_field."='".$item_id."' " ;
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);


        foreach ($result['data'] as $itemId => $valor) {

            $result['data'][$itemId]['fecha_inicio'] = $this->changeDataFormat($result['data'][$itemId]['fecha_inicio'],"d/m/Y");
            $result['data'][$itemId]['fecha_fin'] = $this->changeDataFormat($result['data'][$itemId]['fecha_fin'],"d/m/Y");
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
        $result["recordsTotal"]=$result["recordsFiltered"];
        return $result;
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
             * Realizaremos los cálculos correspondientes de la fecha para los datos del convenio
             */
            $this->setFechaConclusionEnmienda($item_id);
            /**
             * Guardaremos el archivo adjunto enviado desde el formulario
             */
            $item = $this->getItem($res["id"],$item_id);
            $item_id_name = $this->fkey_field;
            $id_name = "id";
            $adjunto = $this->saveAttachment($item,$tabla,$input_file,$item_id,$res["id"],$action,$this->folder,$item_id_name,$id_name);
        }
        return $res;
    }

    private function setFechaConclusionEnmienda($id){
        if($id!=""){
            /**
             * Sacamos los datos del convenio
             */
            /*
            $sql = "select * from ".$this->table["convenio"]." where id=".$id;
            $obj = $this->dbm->execute($sql);
            $convenio = $obj->fields;
            */
            $convenio = $this->getItemData($id);
            //print_struc($convenio);
            /**
             * Calculamos fechas
             */
            $sql = "SELECT max(fecha_fin) as fecha FROM ".$this->table["convenio_enmienda"]." where convenio_id=".$id;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            if(isset($item["fecha"]) && $item["fecha"]!="" ){

                $rec["fecha_conclusion_enmienda"]=$item["fecha"];

                if($convenio["fecha_conclusion"] > $rec["fecha_conclusion_enmienda"]){
                    $rec["convenio_vigencia_fecha"]= $convenio["fecha_conclusion"];
                }else{
                    $rec["convenio_vigencia_fecha"]= $rec["fecha_conclusion_enmienda"];
                }

            }else{
                $rec["fecha_conclusion_enmienda"]= NULL;
                $rec["convenio_vigencia_fecha"]= $convenio["fecha_conclusion"];
            }


            /**
             * Calculamos los años meses dias de la ultima fecha
             */

            $fecha_inicio = date_create($convenio["fecha_firma"]);
            $fecha_fin = date_create($rec["convenio_vigencia_fecha"]);

            $resultado = date_diff($fecha_inicio,$fecha_fin);

            $rec["vigencia_anios"] = $resultado->y;
            $rec["vigencia_mes"] = $resultado->m;
            $rec["vigencia_dias"] = $resultado->d;

            /**
             * Se guarda la información
             */
            $where = "id = ".$id;
            $table = $this->table["convenio"];
            $resp = $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);

        }
    }
    private function getItemData($id){
        /**
         * Sacamos los datos del convenio
         */
        $sql = "select * from ".$this->table["convenio"]." where id=".$id;
        $obj = $this->dbm->execute($sql);
        $item = $obj->fields;
        return $item;
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
                    $dataResult["activo"] = "true";
                    $dataResult[$this->fkey_field]= $item_id;
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
         * Realizaremos los cálculos correspondientes de la fecha para los datos del convenio
         */
        $this->setFechaConclusionEnmienda($item_id);

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
