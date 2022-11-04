<?PHP
namespace App\Sinpreh\Module\ProgramaConvenio\Snippet\General;
use Core\CoreResources;

class Index extends CoreResources
{
    var $objTable = "programa_convenio";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();

    }
    function getItem($idItem){

        $info = '';

        if($idItem!=''){
            $sqlSelect = ' i.*
                           , concat(u1.name,\' \',u1.last_name) AS user_creater
                            , CONCAT(u2.name,\' \',u2.last_name) as user_updater';
            $sqlFrom = ' '.$this->table[$this->objTable].' i
                         LEFT JOIN '.$this->table_core["user"].' u1 on u1.id=i.user_create
                         LEFT JOIN '.$this->table_core["user"].' u2 on u2.id=i.user_update';
            $sqlWhere = ' i.id='.$idItem;
            $sqlGroup = ' ';

            $sql = 'SELECT '.$sqlSelect.'
                  FROM '.$sqlFrom.'
                  WHERE '.$sqlWhere.'
                  '.$sqlGroup;
            $info = $this->dbm->Execute($sql);
            $info = $info->fields;

            /**
             * Sacamos los datos adicionales de las selecciones multiples
             */
            $res = $this->getMultiSelectionData($this->table["programa_convenio_ejecutor"]
                ,"programa_convenio_id"
                , $idItem
                , "ejecutor_id"
            );
            $info["convenio_ejecutor"] = $res;

        }
        return $info;
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
             * Guardamos material type
             */
            $resultado = $this->saveMultiSelectionData(
                $this->table["programa_convenio_ejecutor"]
                , "programa_convenio_id"
                , $id
                , "ejecutor_id"
                , $rec["convenio_ejecutor"]
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
                if ($dataResult["moneda_id"]=="" or $dataResult["moneda_id"]==0){
                    $dataResult["moneda_id"] = NULL;
                }
                if ($dataResult["financiador_id"]=="" or $dataResult["financiador_id"]==0){
                    $dataResult["financiador_id"] = NULL;
                }
                if ($dataResult["implementador_id"]=="" or $dataResult["implementador_id"]==0){
                    $dataResult["implementador_id"] = NULL;
                }
                if ($dataResult["tipo_financiamiento_id"]=="" or $dataResult["tipo_financiamiento_id"]==0){
                    $dataResult["tipo_financiamiento_id"] = NULL;
                }

                break;
        }
        return $dataResult;
    }

}