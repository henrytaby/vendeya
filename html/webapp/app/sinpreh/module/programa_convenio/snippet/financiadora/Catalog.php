<?PHP
namespace App\Sinpreh\Module\ProgramaConvenio\Snippet\Financiadora;
use Core\CoreResources;
class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */
    public function conf_catalog_form(){
        //$this->addCatalogList($this->table["app"],"","","","","","","");
        $this->addCatalogList($this->table["programa_convenio_tipo_financiamiento"]
            ,"programa_convenio_tipo_financiamiento","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["convenio_financiador"]
            ,"programa_convenio_financiador","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["moneda"]
            ,"moneda","","nombre",""
            ,"nombre","","","");
    }
    public function get_activo_option(){
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }
}