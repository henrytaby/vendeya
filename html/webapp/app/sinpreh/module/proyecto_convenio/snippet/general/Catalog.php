<?PHP
namespace App\Sinpreh\Module\ProyectoConvenio\Snippet\General;
use Core\CoreResources;
class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){


        $this->addCatalogList($this->table["tipo"]
            ,"tipo","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["convenio_vigencia_tipo"]
            ,"convenio_vigencia_tipo","","nombre",""
            ,"nombre","","","");


    }

    /*
    public function getGroupOptions(){
        $sql = "select 
                g2.name as padre_name ,g.id, g.name
                
                from ".$this->table["group"]." as g
                left join ".$this->table["group"]." as g2 on g2.id = g.parent
                where g.parent is not null
                order by g.parent, g.name
                ";

        $item = $this->dbm->Execute($sql)->GetRows();
        $res = array();
        foreach ($item as $row){
            $res[$row["padre_name"]] [$row["id"]] = $row["name"];
        }

        return $res;
    }
    public function getTypeOption(){
        global $smarty;
        $dato = array();
        $dato["app"] = $smarty->config_vars["OptApp"];
        $dato["url"] = $smarty->config_vars["OptUrl"];
        return $dato;
    }
    */
}