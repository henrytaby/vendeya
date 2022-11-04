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
    "table" => $appVars["table"] ["organismo_financiador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "of" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"organismo_financiador_id" //Campo de relación en la tabla principal
);
/**
 * Configuración de los campos que mostraremos en la grilla
 */

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_organismo_financiador_id"]
, "table_as"=> "of", "as" => "organismo_financiador_id");

//$grid_item[]=array("field" => "organismo_financiador_id","label"=> $smarty->config_vars["table_organismo_financiador_id"]);
$grid_item[]=array("field" => "aporte_financiero","label"=> $smarty->config_vars["table_aporte_financiero"]);
$grid_item[]=array("field" => "aporte_nofinanciero","label"=> $smarty->config_vars["table_aporte_nofinanciero"]);
$grid_item[]=array("field" => "porcentaje","label"=> $smarty->config_vars["table_porcentaje"]);

$grid_item[]=array("field" => "total_aporte","label"=> $smarty->config_vars["table_total_aporte"]);
$grid_item[]=array("field" => "total_avance","label"=> $smarty->config_vars["table_total_avance"]);
$grid_item[]=array("field" => "total_porcentaje","label"=> $smarty->config_vars["table_total_porcentaje"]);

$grid_item[]=array("field" => "descripcion","label"=> $smarty->config_vars["table_descripcion"]);
$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);

$group = "index";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);


/*---------------------------------------------------------------------------------------------------------------------*/
/**
 * Configuración de tablas relacionales, (JOIN)
 */
/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array("field" => "detalle","label"=> $smarty->config_vars["table_detalle"]);
$grid_item[]=array("field" => "total","label"=> $smarty->config_vars["table_total"]);
$grid_item[]=array("field" => "total_transferido","label"=> $smarty->config_vars["table_total_transferido"]);
$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);

$group = "index_01";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
/*---------------------------------------------------------------------------------------------------------------------*/
/**
 * Configuración de tablas relacionales, (JOIN)
 */
$grid_table[] = array(
    "table" => $appVars["table"] ["programa_convenio"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "pc" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"programa_convenio_id" //Campo de relación en la tabla principal
);
/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_finan_nombre"]
, "table_as"=> "pc", "as" => "convenio_nombre");

$grid_item[]=array( "field" => "codigo", "label"=> $smarty->config_vars["table_finan_codigo"]
, "table_as"=> "pc", "as" => "convenio_codigo");

$grid_item[]=array("field" => "total","label"=> $smarty->config_vars["table_finan_total"]);

$grid_item[]=array("field" => "detalle","label"=> $smarty->config_vars["table_finan_detalle"]);


$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);

$group = "index_02";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
/*---------------------------------------------------------------------------------------------------------------------*/