<?PHP
/**
 * Configuramos todas las grillas que utilizaremos en este snippet
 */
$grid = array();
$grid_table_join = array();

\Core\Core::setLenguage("tableIndex"); //cargamos idioma
/**
 * Configuración de tablas relacionales, (JOIN)
 */
/*
$grid_table[] = array(
    "table" => $appVars["table"] ["distribuidor"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "d" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"distribuidor_id" //Campo de relación en la tabla principal
);
*/
/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array("field"=> "name", "label"=> $smarty->config_vars["table_name"]);
$grid_item[]=array("field"=> "last_name","label"=> $smarty->config_vars["table_name_last"]);
$grid_item[]=array("field"=> "username","label"=> $smarty->config_vars["table_usernme"]);
$grid_item[]=array("field"=> "mobile","label"=> $smarty->config_vars["table_mobile"]);
$grid_item[]=array("field"=> "type","label"=> $smarty->config_vars["table_type"]);
$grid_item[]=array("field"=> "active", "label"=> $smarty->config_vars["table_status"]);

/*
$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_distribuidor"]
, "table_as"=> "d", "as" => "distribuidor");

$grid_item[]=array( "field" => "ciae", "label"=> $smarty->config_vars["table_ciae"]
, "table_as"=> "d", "as" => "ciae");
*/

$grid_item[]=array("field"=> "description", "label"=> $smarty->config_vars["table_description"]);

$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);


$group = "item";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
/**
 * A partir de aca puede añadir todas las grillas que sean necesarias para esta vista
 */
