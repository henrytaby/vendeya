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
$grid_table[] = array(
    "table" => $appVars["table"] ["ampliacion_tipo"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "at" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"ampliacion_tipo_id" //Campo de relación en la tabla principal
);

/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_ampliacion_tipo_id"]
, "table_as"=> "at", "as" => "ampliacion_tipo_id");

$grid_item[]=array("field" => "descripcion","label"=> $smarty->config_vars["table_descripcion"]);

$grid_item[]=array("field" => "dias","label"=> $smarty->config_vars["table_dias"]);

$grid_item[]=array("field" => "fecha_fin","label"=> $smarty->config_vars["table_fecha_fin"]);

$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);

$group = "index";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
