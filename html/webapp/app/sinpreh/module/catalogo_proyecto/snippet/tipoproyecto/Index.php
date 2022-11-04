<?PHP
namespace App\Sinpreh\Module\CatalogoProyecto\Snippet\TipoProyecto;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "tipo_proyecto";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */

    public function getItemDatatableRows(){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "index";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        //$extraWhere = "endorsement_id='".$item_id."' " ;
        $extraWhere = "" ;
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere, $groupBy, $having);
        foreach ($result['data'] as $itemId => $valor) {
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
        return $result;
    }


    function updateData($rec,$itemId,$form,$action ){
        $tabla = $this->table[$this->objTable];
        $itemData  = $this->processData($form,$rec,$action);
        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$tabla,$action,$field_id);
        $res["accion"] = $action;
        /**
         * Process attachment
         */
        return $res;
    }


    function processData($form,$rec,$action="new"){
        $dataResult = array();
        switch($form){
            case 'index':
                $dataResult = $this->processFields($rec,$this->campos[$form],$action);
                /**
                 * Additional processes when saving the data
                 */
                if ($action=="new"){

                }
                break;

        }
        return $dataResult;
    }

    function getItem($id){
        $sql = "select * from ".$this->table[$this->objTable]." as p where p.id = '".$id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    function deleteData($id){
        /**
         * borramos el archivo primero
         */
        //$this->item_delete_archivo_sbm($id,$item_id);
        /**
         * Delete the record from the database
         */
        $field_id="id";
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable]);
        return $res;
    }
}
