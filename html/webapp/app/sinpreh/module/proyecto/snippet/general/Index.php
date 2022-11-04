<?PHP
namespace App\Sinpreh\Module\Proyecto\Snippet\General;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "proyecto";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();

    }

    function updateData($rec,$itemId,$action){
        //print_struc($rec);exit;
        $form="module";
        $itemData  = $this->processData($form,$rec,$action);

        /**
         * Save processed data
         */
        $field_id="id";

        $res = $this->updateItem($itemId,$itemData ,$this->table[$this->objTable],$action,$field_id);
        $res["accion"] = $action;

        /**
         * Guardamos los datos de multiselección
         */
        if($res["res"]){
            $id = $res["id"];
            /**
             * Pueblos Indígenas
             */
            $resultado = $this->saveMultiSelectionData(
                    $this->table["proyecto_puebloindigena"]
                , "proyecto_id"
                , $id
                , "puebloindigena_id"
                , $rec["proyecto_puebloindigena"]
            );
            /**
             * Ejecutor
             */
            $resultado = $this->saveMultiSelectionData(
                $this->table["proyecto_ejecutor"]
                , "proyecto_id"
                , $id
                , "ejecutor_id"
                , $rec["proyecto_ejecutor"]
            );
        }
        return $res;
    }

    function processData($form,$rec,$action="new"){
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

                if ($dataResult["tipo_proyecto_id"]==0){
                    $dataResult["tipo_proyecto_id"] = NULL;
                }

                if($item["fecha_fin_ampliacion"]==""){
                    $dataResult["fecha_conclusion"] =  $dataResult["fecha_fin_inicial"];
                }
                /**
                 * Sumatorias de Beneficiarios y Empleos
                 */
                $dataResult["familia_beneficiarias_total"] = (int)$dataResult["familias_beneficiarias_directa"] +  (int)$dataResult["familias_beneficiarias_indirecta"];
                $dataResult["generacion_empleo_total"] = (int)$dataResult["generacion_empleo_directa"] +  (int)$dataResult["generacion_empleo_indirecta"];
                break;

        }
        return $dataResult;
    }
}