<?PHP
namespace App\Sinpreh\Module\Proyecto\Snippet\General;
use Core\CoreResources;
class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){

        $this->addCatalogList($this->table["tipo_proyecto"]
            ,"tipo_proyecto","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["ejecutor"]
            ,"ejecutor","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["puebloindigena"]
            ,"puebloindigena","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["macroregion"]
            ,"macroregion","","nombre",""
            ,"nombre","","","");
    }
}