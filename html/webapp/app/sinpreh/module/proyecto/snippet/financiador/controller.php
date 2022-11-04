<?PHP
use App\Sinpreh\Module\Proyecto\Snippet\Financiador\Index;
use App\Sinpreh\Module\Proyecto\Snippet\Financiador\Catalog;
use Core\Core;

$objItem = new Index();
$objCatalog = new Catalog();
/**
 * Todo el sub Control se recuperará mediante llamadas por ajax
 */
$templateModule = $frontend["baseAjax"];
/**
 * Variables adicionales
 */
if(isset($_REQUEST["numTable"])) $numTable = $_REQUEST["numTable"];

switch($action){
    /**
     * Página por defecto (index)
     */
    default:
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("index");

        $cataobj["activo"] = $objCatalog->get_activo_option();
        $smarty->assign("cataobj", $cataobj);
        /**
         * Grid configuration
         */
        $gridItem = $objItem->getGridItem("index");
        $smarty->assign("gridItem", $gridItem);
        /**
         * Grid 01
         */
        $gridItem = $objItem->getGridItem("index_01");
        //print_struc($gridItem);
        $smarty->assign("gridItem_01", $gridItem);
        /**
         * Grid 02
         */
        $gridItem = $objItem->getGridItem("index_02");
        //print_struc($gridItem);
        $smarty->assign("gridItem_02", $gridItem);


        $smarty->assign("subpage",$webm["sc_index"]);
        break;
    /**
     * Creación de JSON
     */
    case 'list':
        //$datatable_debug= true;
        $res = $objItem->getItemDatatableRows($item_id,$numTable);
        Core::printJson($res);
        break;
    case 'get.form':
        /**
         * Para diferentes tipos de formularios
         */
        switch($numTable){
            default:
                \Core\Core::setLenguage("formItem");
                $objCatalog->conf_catalog_form($item,$item_id);
                $cataobj = $objCatalog->getCatalogList();
                $smarty->assign("cataobj" , $cataobj);

                $smarty->assign("subpage",$webm["sc_form"]);
                break;
            case '1':
                \Core\Core::setLenguage("formItem_01");
                $smarty->assign("subpage",$webm["sc_form_01"]);
                break;
            case '2':

                $cataobj["proyecto_finan"] = $objCatalog->get_finan_opt($item_id);
                $smarty->assign("cataobj" , $cataobj);

                \Core\Core::setLenguage("formItem_02");
                $smarty->assign("subpage",$webm["sc_form_02"]);
                break;
        }

        /**
         * Language settings, section
         */
        $smarty->assign("item_id",$item_id);

        if($type=="update"){
            $item = $objItem->getItem($id2,$item_id,$numTable);
        }else{
            //
        }

        $smarty->assign("item",$item);

        $smarty->assign("type",$type);
        $smarty->assign("id",$id2);

        break;

    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"],$id2,$type,$item_id,$numTable);
        Core::printJson($respuesta);
        break;

    case 'delete':
        $res = $objItem->deleteData($id2,$item_id,$numTable);
        Core::printJson($res);
        break;

    case 'get.resumenorgfinanciador':
        $total = $objItem->getTotal($item_id);
        $smarty->assign("total", $total);
        \Core\Core::setLenguage("resumenOrganismoFinanciador");
        $smarty->assign("subpage",$webm["sc_resumen_organismo_financiador"]);
        break;

}
