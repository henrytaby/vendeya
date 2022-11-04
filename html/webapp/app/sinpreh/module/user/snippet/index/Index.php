<?PHP
namespace App\Sinpreh\Module\User\Snippet\Index;
use Core\CoreResources;
class Index extends CoreResources {
    var $objTable = "user";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    function getItem($idItem){
        $info = '';
        if($idItem!=''){
            $sqlSelect = ' i.*
                           , concat(u1.name,\' \',u1.last_name) AS user_creater
                            , CONCAT(u2.name,\' \',u2.last_name) as user_updater';
            $sqlFrom = ' '.$this->table[$this->objTable].' i
                         LEFT JOIN '.$this->table_core["user"].' u1 on u1.id=i.user_create
                         LEFT JOIN '.$this->table_core["user"].' u2 on u2.id=i.user_update';
            $sqlWhere = ' i.id='.$idItem;
            $sqlGroup = ' ';

            $sql = 'SELECT '.$sqlSelect.'
                  FROM '.$sqlFrom.'
                  WHERE '.$sqlWhere.'
                  '.$sqlGroup;
            $info = $this->dbm->Execute($sql);
            $info = $info->fields;
            //print_struc($info);
            $info["password"] = trim($info["password"]);
        }
        return $info;
    }
    function get_filtro_where($item){
        $where = "";
        if( isset($item["type"]) and trim($item["type"])!="no" ){
            $data = $item["type"];
            $where = " g.type=".$data;
        }
/*
        if( isset($item["skin"]) and trim($item["skin"])!="no" ){
            if($where != ""){
                $where .= " and ";
            }
            $data = $item["skin"]?"TRUE":"FALSE";
            $where .= " g.skin=".$data;
        }

        if( isset($item["parts"]) and trim($item["parts"])!="no" ){
            if($where != ""){
                $where .= " and ";
            }
            $data = $item["parts"]?"TRUE":"FALSE";
            $where .= " g.parts=".$data;
        }

        if( isset($item["quota"]) and trim($item["quota"])!="no" ){
            if($where != ""){
                $where .= " and ";
            }
            $data = $item["quota"]?"TRUE":"FALSE";
            $where .= " g.quota=".$data;
        }

        if( isset($item["life_animals"]) and trim($item["life_animals"])!="no" ){
            if($where != ""){
                $where .= " and ";
            }
            $data = $item["life_animals"]?"TRUE":"FALSE";
            $where .= " g.life_animals=".$data;
        }
*/
        return $where;
    }

    public function getItemDatatableRows($filter){

        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "item";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        $where = $this->get_filtro_where($filter);
        $where = str_replace("g.","i.",$where);

        $extraWhere = $where;

        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);

        foreach ($result['data'] as $itemId => $valor) {
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
        return $result;
    }

    /**
     * Index::deleteData($id)
     *
     * Delete a record from the database
     *
     * @param $id
     * @return mixed
     */
    function deleteData($id){
        $field_id="id";
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable]);
        return $res;
    }

}