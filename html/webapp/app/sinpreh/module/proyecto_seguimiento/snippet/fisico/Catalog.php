<?PHP
namespace App\Sinpreh\Module\ProyectoSeguimiento\Snippet\Fisico;
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
/*
        $this->addCatalogList($this->table["proyecto_actividad"]
            ,"proyecto_actividad","","detalle",""
            ,"nombre","","","");
*/
    }
    public function get_activo_option(){
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }

    public function get_metas($id){
        $sql = "select pa.id,
                at.nombre as actividad_tipo,
                pa.detalle,
                pa.avance_total,
                pa.total,
                au.nombre as actividad_unidad,
                pa.avance_fisico
                from proyecto_actividad as pa 
                left join catalogo.actividad_tipo as at on at.id= pa.actividad_tipo_id
                left join catalogo.actividad_unidad as au on au.id =pa.actividad_unidad_id
                where proyecto_id=".$id;

        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        $dato = array();
        foreach ($item as $row){
            $dato[$row["id"]] = $row["actividad_tipo"]." - ".$row["detalle"]." - (".$row["avance_total"]."/".$row["total"].") ".$row["actividad_unidad"]." - ".$row["avance_fisico"]." %";
        }
        return $dato;
    }

    public function get_metas_opt($id){
        $sql = "select pa.id,
                at.nombre as actividad_tipo,
                pa.detalle,
                pa.avance_total,
                pa.total,
                au.nombre as actividad_unidad,
                pa.avance_fisico
                from proyecto_actividad as pa 
                left join catalogo.actividad_tipo as at on at.id= pa.actividad_tipo_id
                left join catalogo.actividad_unidad as au on au.id =pa.actividad_unidad_id
                where proyecto_id=".$id;

        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        $dato = array();
        foreach ($item as $row){
            $dato[$row["id"]] = $row["actividad_tipo"]." - Total: ".$row["total"]." ".$row["actividad_unidad"]." - ".$row["detalle"];
        }
        return $dato;
    }

}