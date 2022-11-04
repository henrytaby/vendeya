<?PHP
namespace App\Sinpreh\Module\Proyecto\Snippet\Actividad;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "proyecto_actividad";
    var $folder = "actividad";
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
            if(isset($result['data'][$itemId]['fecha'])) $result['data'][$itemId]['fecha'] = $this->changeDataFormat($result['data'][$itemId]['fecha'],"d/m/Y");
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
             * Recalculamos el porcentaje global
             */
            //print_struc($item_id);
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
        $dataResult = $this->processFields($rec,$this->campos[$form],$action);
        switch($form){
            case 'index':
                /**
                 * Additional processes when saving the data
                 */
                if ($action=="new"){
                    //$dataResult["activo"] = "true";
                    $dataResult[$this->fkey_field]= $item_id;
                }
                break;
            case 'addactividad':
                //$dataResult["type"] = 2;
                break;
            case 'addunidad':
                //$dataResult["type"] = 2;
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
         * Recalculamos el porcentaje global
         */
        $this->updateMeta($item_id);
        return $res;
    }


    function updateDataActividad($rec){
        $action = "new";
        $item_id = "";
        $itemId = "";
        $tabla = $this->table["actividad_tipo"];
        $form = "addactividad";
        $itemData  = $this->processData($form,$rec,$action,$item_id);

        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$tabla,$action,$field_id);
        $res["accion"] = $action;

        return $res;
    }
    function updateDataUnidad($rec){
        $action = "new";
        $item_id = "";
        $itemId = "";
        $tabla = $this->table["actividad_unidad"];
        $form = "addunidad";
        $itemData  = $this->processData($form,$rec,$action,$item_id);

        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$tabla,$action,$field_id);
        $res["accion"] = $action;

        return $res;
    }
}
