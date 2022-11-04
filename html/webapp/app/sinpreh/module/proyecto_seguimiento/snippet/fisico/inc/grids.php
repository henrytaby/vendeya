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
    "table" => $appVars["table"] ["proyecto_actividad"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "pa" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"proyecto_actividad_id" //Campo de relación en la tabla principal
);

$grid_table[] = array(
    "table" => $appVars["table"] ["actividad_tipo"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "at" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"pa.actividad_tipo_id" //Campo de relación en la tabla principal
);

$grid_table[] = array(
    "table" => $appVars["table"] ["actividad_unidad"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "au" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"pa.actividad_unidad_id" //Campo de relación en la tabla principal
);
/**
 * Configuración de los campos que mostraremos en la grilla
 */

$grid_item[]=array("field" => "fecha","label"=> $smarty->config_vars["table_fecha"]);

/*
$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_actividad_tipo"]
, "table_as"=> "at", "as" => "actividad_tipo");
*/
/*
$grid_item[]=array( "field" => "detalle", "label"=> $smarty->config_vars["table_proyecto_actividad_id"]
, "table_as"=> "pa", "as" => "proyecto_actividad");
*/

$grid_item[]=array("field" => "total","label"=> $smarty->config_vars["table_total"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_unidad"]
, "table_as"=> "au", "as" => "unidad");

$grid_item[]=array("field" => "detalle","label"=> $smarty->config_vars["table_detalle"]);

$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);


$group = "index";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
