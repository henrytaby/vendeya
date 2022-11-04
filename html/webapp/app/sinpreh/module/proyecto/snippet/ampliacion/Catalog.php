<?PHP
namespace App\Sinpreh\Module\Proyecto\Snippet\Ampliacion;
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

        $this->addCatalogList($this->table["ampliacion_tipo"]
            ,"ampliacion_tipo","","nombre",""
            ,"nombre","","","");

    }
    public function get_activo_option(){

    }
}