<?PHP
use App\Sinpreh\Module\Proyecto\Snippet\Actividad\Index;
use App\Sinpreh\Module\Proyecto\Snippet\Actividad\Catalog;
use Core\Core;
use App\Sinpreh\Module\Proyecto\Snippet\index\Index as indexParent;

$objItem = new Index();
$objCatalog = new Catalog();
$objItemParent = new indexParent();
/**
 * Todo el sub Control se recuperará mediante llamadas por ajax
 */
$templateModule = $frontend["baseAjax"];

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
        $smarty->assign("subpage",$webm["sc_index"]);
        break;
    /**
     * Creación de JSON
     */
    case 'list':
        //$datatable_debug= true;
        $res = $objItem->getItemDatatableRows($item_id);
        Core::printJson($res);
        break;
    case 'get.form':

        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItem");

        $smarty->assign("item_id",$item_id);



        if($type=="update"){
            $item = $objItem->getItem($id2,$item_id);
        }else{
            //$item = "";
            $item["class"] = "fab fa-buffer";
            $item["order"] = "1";
            $item["active"] = "1";
        }
        $smarty->assign("item",$item);

        $objCatalog->conf_catalog_form($item,$item_id);
        $cataobj = $objCatalog->getCatalogList();
        $smarty->assign("cataobj" , $cataobj);
        //print_struc($cataobj);

        $smarty->assign("type",$type);
        $smarty->assign("id",$id2);
        $smarty->assign("subpage",$webm["sc_form"]);
        break;

    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"],$id2,"index",$type,$item_id);
        Core::printJson($respuesta);
        break;

    case 'delete':
        $res = $objItem->deleteData($id2,$item_id);
        Core::printJson($res);
        break;


    /**
     * Todas las funcionalidades para añadir actividad
     */
    case 'get.formaddactividad':
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItemAddActividad");
        $smarty->assign("subpage",$webm["sc_formAddactividad"]);
        break;

    case 'saveaddactividad':
        $respuesta = $objItem->updateDataActividad($item);
        Core::printJson($respuesta);
        break;

    case 'get.actividad':
        $item = $objCatalog->getActividadOptions();
        Core::printJson($item);
        break;

    /**
     * Todas las funcionalidades para añadir Unidad
     */
    case 'get.formaddunidad':
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItemAddUnidad");
        $smarty->assign("subpage",$webm["sc_formAddunidad"]);
        break;

    case 'saveaddunidad':
        $respuesta = $objItem->updateDataUnidad($item);
        Core::printJson($respuesta);
        break;

    case 'get.unidad':
        $item = $objCatalog->getUnidadOptions();
        Core::printJson($item);
        break;

    case 'get.avancefisico':
        $item = $objItemParent->getItem($id);
        //print_struc($item);
        $smarty->assign("item",$item);
        \Core\Core::setLenguage("avanceFisico");
        $smarty->assign("subpage",$webm["sc_avance_fisico"]);
        break;

}
