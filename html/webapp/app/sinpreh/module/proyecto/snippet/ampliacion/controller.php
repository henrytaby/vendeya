<?PHP
use App\Sinpreh\Module\Proyecto\Snippet\Ampliacion\Index;
use App\Sinpreh\Module\Proyecto\Snippet\Ampliacion\Catalog;
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



        //print_struc($proyecto); fecha_conclusion

        if($type=="update"){
            $item = $objItem->getItem($id2,$item_id);
            $fecha_inicio = $item["fecha_inicio"];
        }else{
            $proyecto = $objItemParent->getItem($item_id);
            $fecha_inicio = $proyecto["fecha_conclusion"];
        }

        $smarty->assign("fecha_inicio",$fecha_inicio);
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

    case 'download':
        $objItem->getFile($id2,$item_id);
        break;

}
