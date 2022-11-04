<?PHP
namespace App\Sinpreh\Module\Geovisor\Snippet\Index;
use Core\CoreResources;
class Catalog extends CoreResources{
    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    public function confCatalog(){

        $where = "cod_dep!='0' ";
        $this->addCatalogList($this->table["departamento"]
            ,"departamento","","name",""
            ,"name",$where,"","");

                //$where = "cod_dep!='0' ";
                $this->addCatalogList($this->table["estado"]
                    ,"estado","","nombre",""
                    ,"nombre","","","");

/*
                $this->addCatalogList($this->table["gd_tipo_fuente_generacion"]
                    ,"gd_tipo_fuente_generacion","","nombre",""
                    ,"nombre","","","");
                */

    }
    public function getActiveOption(){
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }
}