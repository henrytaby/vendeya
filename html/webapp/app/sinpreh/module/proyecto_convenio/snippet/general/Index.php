<?PHP
namespace App\Sinpreh\Module\ProyectoConvenio\Snippet\General;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "convenio";

    var $folder = "respaldo";
    //var $fkey_field = "convenio_id";

    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();

    }

    function updateData($rec,$itemId,$action,$input_file){
        $tabla = $this->table[$this->objTable];

        //print_struc($rec);exit;
        $form="module";
        $itemData  = $this->processData($form,$rec,$action,$itemId);
        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$tabla,$action,$field_id);
        $res["accion"] = $action;
        /**
         * Guardamos datos geográficos para postgresql
         */
        if( $res["res"]==1){

            /**
             * Guardaremos el archivo adjunto enviado desde el formulario
             */
            $item = $this->getItem($res["id"]);
            $item_id_name = "id";
            $id_name = "id";
            $id = $res["id"];
            $adjunto = $this->saveAttachment($item,$tabla,$input_file,$id,$id,$action,$this->folder,$item_id_name,$id_name);
        }
        return $res;
    }

    function processData($form,$rec,$action="new",$id){
        $dataResult = array();
        switch($form){
            case 'module':
                $dataResult = $this->processFields($rec,$this->campos[$form],$action);
                /**
                 * Additional processes when saving the data
                 */
                if ($action=="new"){
                    //$dataResult["active"] = 1;
                }
                $dataResult["numero_convenio_txt"] = $dataResult["numero_convenio"]."/".$dataResult["gestion"];

                $item = $this->getItem($id);

                if($item["fecha_conclusion_enmienda"]==""){
                    $dataResult["convenio_vigencia_fecha"] =  $dataResult["fecha_conclusion"];
                }


                break;
        }
        return $dataResult;
    }

    public function getItem($id){
        $sql = "select * from ".$this->table["convenio"]." where id=".$id;
        $obj = $this->dbm->execute($sql);
        $item = $obj->fields;
        return $item;
    }

    private function setFechaConclusionEnmienda($id){
        if($id!=""){
            /**
             * Sacamos los datos del convenio
             */

            $sql = "select * from ".$this->table["convenio"]." where id=".$id;
            $obj = $this->dbm->execute($sql);
            $convenio = $obj->fields;
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
            $where = "id = ".$id;
            $table = $this->table["convenio"];
            $resp = $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);

        }
    }
    function getDepartamentData($long,$lat){

        $sql = "select   
                m.id
                ,m.c_ut
                ,m.departamen
                ,m.provincia
                ,m.name
                ,m.capital
                ,m.departamento_id
                
                from ".$this->table["municipio"]." as m where st_intersects(m.geom, st_setsrid(st_makepoint(".$long.", ".$lat."), 4326))";

        $info = $this->dbm->Execute($sql);
        $data = $info->getRows();

        return $data[0];
    }

    function getFile($id){
        $msg_erro = "<div style='text-align: center;  background-color: #fee7dc;vertical-align: center; padding-top: 50px;padding-bottom: 50px;'><span style='color:red; font-family: Arial;font-size:26px;'>The file does not exists</span></div>";
        $item = $this->getItem($id);

        if($item["id"]!=""){
            $dir  = $this->getAttachmentDir($id,0,$this->folder);
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

    function deleteData($id){
        $item = $this->getItem($id);
        /**
         * borramos el archivo primero
         */
        $this->deleteAttachmentFile($id,$id,$item["attached_extension"],$this->folder);
        /**
         * Delete the record from the database
         */
        $tabla = $this->table[$this->objTable];
        $rec["attached_name"] =NULL;
        $rec["attached_extension"] =NULL;
        $rec["attached_size"] =NULL;
        $rec["attached_type"] =NULL;
        $where = "id=".$id;
        //$this->dbm->debug = true;
        $this->dbm->autoExecute($tabla,$rec,"UPDATE",$where);

        $res["res"] = 1;
        $res["id"] = $id;

        return $res;
    }
}