<?PHP
use App\Sinpreh\Module\ProyectoConvenio\Snippet\General\Index;
use App\Sinpreh\Module\ProyectoConvenio\Snippet\General\Catalog;
use Core\Core;

$objItem = new Index();
$objCatalog = new Catalog();
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
            $item = $objItem->getItem($id);
            //print_struc($item);
        }else{

        }
        $smarty->assign("item",$item);
        /**
         * Catalog
         */

        $objCatalog->confCatalog();
        $cataobj= $objCatalog->getCatalogList();

        //print_struc($cataobj);exit;
        $smarty->assign("cataobj", $cataobj);

        $smarty->assign("subpage",$webm["sc_index"]);
        break;

    case 'save':
        //$respuesta = $objItem->updateData($_REQUEST["item"],$id2,"index",$type,$item_id,$_FILES["input_file"]);
        $respuesta = $objItem->updateData($_REQUEST["item"],$id,$type,$_FILES["input_file"]);
        Core::printJson($respuesta);
        break;

    case 'download':
        $objItem->getFile($id);
        break;

    case 'delete':
        $res = $objItem->deleteData($id);
        Core::printJson($res);
        break;


}