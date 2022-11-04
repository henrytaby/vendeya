<?PHP
use App\Sinpreh\Module\ProyectoSeguimiento\Snippet\Fisico\Index;
use App\Sinpreh\Module\ProyectoSeguimiento\Snippet\Fisico\Catalog;
use Core\Core;
use App\Sinpreh\Module\ProyectoSeguimiento\Snippet\index\Index as indexParent;
$objItem = new Index();
$objCatalog = new Catalog();
$objItemParent = new indexParent();
/**
 * Todo el sub Control se recuperará mediante llamadas por ajax
 */
$templateModule = $frontend["baseAjax"];
/**
 * Variables
 */
if(isset($_REQUEST["meta"])) $meta=$_REQUEST["meta"];

switch($action){
    /**
     * Página por defecto (index)
     */
    default:
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("index");


        $cataobj["proyecto_actividad"] = $objCatalog->get_metas_opt($item_id);
        $smarty->assign("cataobj" , $cataobj);
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
        $res = $objItem->getItemDatatableRows($item_id,$filter);
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
            $item = "";
        }
        $smarty->assign("item",$item);

        $objCatalog->conf_catalog_form($item,$item_id);
        $cataobj = $objCatalog->getCatalogList();

        $cataobj["proyecto_actividad"] = $objCatalog->get_metas($item_id);
        $smarty->assign("cataobj" , $cataobj);

        $smarty->assign("type",$type);
        $smarty->assign("id",$id2);
        $smarty->assign("subpage",$webm["sc_form"]);
        break;

    case 'save':

        $respuesta = $objItem->updateData($_REQUEST["item"],$id2,"index",$type,$item_id,$_FILES["input_file"]);
        Core::printJson($respuesta);
        break;

    case 'delete':
        $res = $objItem->deleteData($id2,$item_id);
        Core::printJson($res);
        break;

    case 'get.avancefisico':
        $item = $objItemParent->getItem($id);
        //print_struc($item);
        $smarty->assign("item",$item);
        \Core\Core::setLenguage("avanceFisico");
        $smarty->assign("subpage",$webm["sc_avance_fisico"]);
        break;

    case 'get.avancefisicometa':
        $item = $objItem->getItemMeta($meta,$item_id);
        //print_struc($item);
        $smarty->assign("item",$item);
        \Core\Core::setLenguage("avanceFisico");
        $smarty->assign("subpage",$webm["sc_avance_fisico_meta"]);
        break;

}
