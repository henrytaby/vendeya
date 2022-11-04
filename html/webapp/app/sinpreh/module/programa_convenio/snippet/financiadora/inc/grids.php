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
    "table" => $appVars["table"] ["convenio_financiador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "f" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"programa_convenio_financiador_id" //Campo de relación en la tabla principal
);
$grid_table[] = array(
    "table" => $appVars["table"] ["programa_convenio_tipo_financiamiento"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "tf" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"programa_convenio_tipo_financiamiento_id" //Campo de relación en la tabla principal
);
$grid_table[] = array(
    "table" => $appVars["table"] ["moneda"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "m" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"moneda_id" //Campo de relación en la tabla principal
);
/**
 * Configuración de los campos que mostraremos en la grilla
 */

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_financiador"]
, "table_as"=> "f", "as" => "financiador");

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_tipofinanciador"]
, "table_as"=> "tf", "as" => "tipofinanciador");

$grid_item[]=array("field" => "monto","label"=> $smarty->config_vars["table_monto"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_moneda"]
, "table_as"=> "m", "as" => "moneda_id");

$grid_item[]=array("field" => "monto_bs","label"=> $smarty->config_vars["table_monto_bs"]);
$grid_item[]=array("field" => "descripcion","label"=> $smarty->config_vars["table_descripcion"]);



$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);


$group = "index";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
