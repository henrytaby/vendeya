<?PHP
namespace App\Sinpreh\Module\Proyecto\Snippet\Datos;
use Core\CoreResources;
class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog($item){
        //print_struc($item);

        $this->addCatalogList($this->table["tipo"]
            ,"tipo","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["estado"]
            ,"estado","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["programa"]
            ,"programa","","nombre",""
            ,"nombre","","","");

        $where = $item["programa_id"] != ""?" programa_id = ".$item["programa_id"]:"";
        $this->addCatalogList($this->table["programa_convenio"]
            ,"programa_convenio","","codigo",""
            ,"codigo",$where,"","");


        $where = $item["tipo_id"] != ""?" tipo_id = ".$item["tipo_id"]:"";
        $this->addCatalogList($this->table["convenio"]
            ,"convenio","","numero_convenio_txt",""
            ,"numero_convenio",$where,"","");

    }

    function getConvenioOptions($id){
        /**
         * sacamos los convencios segun el tipo
         */
        if($id!="" and $id>0){
            $sql = "select * from ".$this->table["convenio"]." as sr where sr.tipo_id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

    function getConvenioProgramaOptions($id){
        /**
         * sacamos los convenio segun el programa
         */
        if($id!="" and $id>0){
            $sql = "select * from ".$this->table["programa_convenio"]." as sr where sr.programa_id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

}