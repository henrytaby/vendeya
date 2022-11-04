<?PHP
use App\Sinpreh\Module\Proyecto\Snippet\Datos\Index;
use App\Sinpreh\Module\Proyecto\Snippet\Datos\Catalog;
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
        \Core\Core::setLenguage("general");

        $smarty->assign("type",$type);
        if($type=="update"){
            $item = $objItemParent->getItem($id);
        }else{
            $item = array();
        }
        $smarty->assign("item",$item);
        /**
         * Catalog
         */

        $objCatalog->confCatalog($item);
        $cataobj= $objCatalog->getCatalogList();
        //print_struc($cataobj);exit;
        $smarty->assign("cataobj", $cataobj);

        $smarty->assign("subpage",$webm["sc_index"]);
        break;

    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"],$id,$type);
        Core::printJson($respuesta);
        break;

    case 'get.convenio':
        $item = $objCatalog->getConvenioOptions($id);
        Core::printJson($item);
        break;

    case 'get.convenio_programa':
        $item = $objCatalog->getConvenioProgramaOptions($id);
        Core::printJson($item);
        break;


}