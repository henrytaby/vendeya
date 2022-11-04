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
    "table" => $appVars["table"] ["programa"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "p" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"programa_id" //Campo de relación en la tabla principal
);
$grid_table[] = array(
    "table" => $appVars["table"] ["estado"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "e" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"estado_id" //Campo de relación en la tabla principal
);


$grid_table[] = array(
    "table" => $appVars["table"] ["convenio"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "c" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"convenio_id" //Campo de relación en la tabla principal
);

$grid_table[] = array(
    "table" => $appVars["table"] ["tipo"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "t" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"tipo_id" //Campo de relación en la tabla principal
);

$grid_table[] = array(
    "table" => $appVars["table"] ["tipo_proyecto"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "tp" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"tipo_proyecto_id" //Campo de relación en la tabla principal
);



/**
 * Configuración de los campos que mostraremos en la grilla
 */


$grid_item[]=array( "field" => "numero_convenio_txt", "label"=> $smarty->config_vars["table_convenio_id"]
, "table_as"=> "c", "as" => "convenio_id");



$grid_item[]=array("field"=> "nombre", "label"=> $smarty->config_vars["table_nombre"]);

$grid_item[]=array("field" => "emblematico","label"=> $smarty->config_vars["table_emblematico"]);
$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_estado"]
, "table_as"=> "e", "as" => "estado");


$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_tipo"]
, "table_as"=> "t", "as" => "tipo");

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_programa"]
, "table_as"=> "p", "as" => "programa");

$grid_item[]=array("field" => "gestion","label"=> $smarty->config_vars["table_gestion"]);

$grid_item[]=array("field"=> "avance_fisico","label"=> $smarty->config_vars["table_avance_fisico"]);
$grid_item[]=array("field"=> "avance_financiero","label"=> $smarty->config_vars["table_avance_financiero"]);


$grid_item[]=array("field" => "sisin","label"=> $smarty->config_vars["table_sisin"]);
$grid_item[]=array("field" => "sisin_fecha","label"=> $smarty->config_vars["table_sisinfecha"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_tipo_proyecto"]
, "table_as"=> "tp", "as" => "tipo_proyecto_id");


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
/*/
print_struc($grid_table_join);
print_struc($grid);
exit;
/**/