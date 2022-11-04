<?PHP
namespace App\Sinpreh\Module\ProgramaConvenio\Snippet\General;
use Core\CoreResources;
class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){
        $this->addCatalogList($this->table["ejecutor"]
            ,"ejecutor","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["programa"]
            ,"programa","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["programa_convenio_estado"]
            ,"programa_convenio_estado","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["programa_convenio_moneda"]
            ,"programa_convenio_moneda","","nombre",""
            ,"nombre","","","");

    }

}