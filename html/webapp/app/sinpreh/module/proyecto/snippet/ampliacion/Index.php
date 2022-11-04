<?PHP
namespace App\Sinpreh\Module\Proyecto\Snippet\Ampliacion;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "proyecto_ampliacion";
    var $folder = "financiador";
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
            $result['data'][$itemId]['fecha_fin'] = $this->changeDataFormat($result['data'][$itemId]['fecha_fin'],"d/m/Y");
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
        $result["recordsTotal"]=$result["recordsFiltered"];
        return $result;
    }


    function updateData($rec,$itemId,$form,$action,$item_id){
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
            $this->setFechaConclusionAmpliacion($item_id);

        }
        return $res;
    }

    private function setFechaConclusionAmpliacion($id){
        if($id!=""){
            /**
             * Sacamos los datos del convenio
             */
            $sql = "select * from ".$this->table["proyecto"]." where id=".$id;
            $obj = $this->dbm->execute($sql);
            $proyecto = $obj->fields;
            //print_struc($proyecto);exit;

            /**
             * Calculamos fechas
             */
            $sql = "SELECT max(fecha_fin) as fecha FROM ".$this->table["proyecto_ampliacion"]." where proyecto_id=".$id;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            //print_struc($item);exit;
            $rec = array();
            if(isset($item["fecha"]) && $item["fecha"]!="" ){

                $rec["fecha_fin_ampliacion"]=$item["fecha"];

                if($proyecto["fecha_fin_inicial"] > $rec["fecha_fin_ampliacion"]){
                    $rec["fecha_conclusion"]= $proyecto["fecha_fin_inicial"];
                }else{
                    $rec["fecha_conclusion"]= $rec["fecha_fin_ampliacion"];
                }

            }else{
                $rec["fecha_fin_ampliacion"]= NULL;
                $rec["fecha_conclusion"]= $proyecto["fecha_fin_inicial"];
            }

            $where = "id = ".$id;
            $table = $this->table["proyecto"];
            $resp = $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);

        }
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
                }else{
                    unset($dataResult["fecha_inicio"]);
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
        /**
         * Delete the record from the database
         */
        $field_id="id";
        $where = $this->fkey_field."='".$item_id."'";
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable],$where);

        /**
         * Realizaremos los cálculos correspondientes de la fecha para los datos del convenio
         */
        $this->setFechaConclusionAmpliacion($item_id);
        
        return $res;
    }


}
