<?PHP
namespace App\Sinpreh\Module\Proyecto\Snippet\Actividad;
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

        $this->addCatalogList($this->table["actividad_tipo"]
            ,"actividad_tipo","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["actividad_unidad"]
            ,"actividad_unidad","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["actividad_estado"]
            ,"actividad_estado","","nombre",""
            ,"nombre","","","");
    }
    public function get_activo_option(){
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }

    function getActividadOptions(){
        /**
         * sacamos datos de personas
         */
        $sql = "select p.id, p.nombre from ".$this->table["actividad_tipo"]." as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    function getUnidadOptions(){
        /**
         * sacamos datos de personas
         */
        $sql = "select p.id, p.nombre from ".$this->table["actividad_unidad"]." as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }
}