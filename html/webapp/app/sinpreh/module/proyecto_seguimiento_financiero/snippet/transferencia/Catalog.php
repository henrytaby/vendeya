<?PHP
namespace App\Sinpreh\Module\ProyectoSeguimientoFinanciero\Snippet\Transferencia;
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

        $this->addCatalogList($this->table["organismo_financiador"]
            ,"organismo_financiador","","nombre",""
            ,"nombre","","","");
    }
    public function get_activo_option(){
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }

    public function get_finan_opt($id){
        $sql = "select 
                pc.id,pc.codigo,pc.nombre
                from programa_convenio as pc 
                left join proyecto as p on p.programa_id = pc.programa_id
                where p.id =".$id;
        //$sql = "select id,codigo,nombre from programa_convenio as pc  where pc.programa_id = 8";
        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        $dato = array();
        foreach ($item as $row){
            $dato[$row["id"]] = $row["nombre"]." -| Código: ".$row["codigo"];
        }
        return $dato;
    }

    /**
     * Para formulario 00
     */
    public function conf_catalog_form_00($id){
        $where = "proyecto_id=".$id;
        $this->addCatalogList($this->table["proyecto_transferencia"]
            ,"transferencia","","detalle",""
            ,"detalle",$where,"","");
    }

    public function get_financiero_opt($id){
        $sql = "select pf.id, of.nombre
        from proyecto_financiador as pf
        left join catalogo.organismo_financiador as of on of.id = pf.organismo_financiador_id
        where 
        pf.organismo_financiador_id <> 1 
        and pf.proyecto_id = ".$id;

        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        $dato = array();
        foreach ($item as $row){
            $dato[$row["id"]] = $row["nombre"];
        }
        return $dato;
    }

    public function get_financiamiento_opt($id){
        $sql = "select 
                ppc.id, pc.nombre,pc.codigo
                from proyecto_programa_convenio as ppc
                left join programa_convenio as pc on pc.id = ppc.programa_convenio_id
                where ppc.proyecto_id =".$id;

        $item = $this->dbm->Execute($sql);
        $item = $item->getRows();
        $dato = array();
        foreach ($item as $row){
            $dato[$row["id"]] = $row["nombre"]." - ".$row["codigo"];
        }
        return $dato;
    }



}