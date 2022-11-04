<?PHP
namespace App\Sinpreh\Module\ProgramaConvenio\Snippet\Index;
use Core\CoreResources;
class Catalog extends CoreResources{
    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }

    public function getActiveOption(){
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }

    public function confCatalog(){

        $this->addCatalogList($this->table["programa"]
            ,"programa","nombre","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["programa_convenio_estado"]
            ,"programa_convenio_estado","nombre","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["convenio_financiador"]
            ,"programa_convenio_financiador","nombre","nombre",""
            ,"nombre","","","");


    }
}