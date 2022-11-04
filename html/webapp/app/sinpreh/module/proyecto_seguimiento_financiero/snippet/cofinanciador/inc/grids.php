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
    "table" => $appVars["table"] ["proyecto_financiador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "pf" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"proyecto_financiador_id" //Campo de relación en la tabla principal
);

$grid_table[] = array(
    "table" => $appVars["table"] ["organismo_financiador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "of" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"pf.organismo_financiador_id" //Campo de relación en la tabla principal
);

/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array("field" => "fecha","label"=> $smarty->config_vars["table_fecha"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_proyecto_financiador_id"]
, "table_as"=> "of", "as" => "proyecto_financiador_id");

$grid_item[]=array("field" => "monto","label"=> $smarty->config_vars["table_monto"]);
$grid_item[]=array("field" => "detalle","label"=> $smarty->config_vars["table_detalle_transferencia"]);

$grid_item[]=array("field"=> "attached_name","label"=> $smarty->config_vars["table_attached_name"]);
$grid_item[]=array("field" => "attached_size","label"=> $smarty->config_vars["table_attached_size"]);

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
$grid_table[] = array(
    "table" => $appVars["table"] ["proyecto_financiador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "pf" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"proyecto_financiador_id" //Campo de relación en la tabla principal
);

$grid_table[] = array(
    "table" => $appVars["table"] ["organismo_financiador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "of" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"pf.organismo_financiador_id" //Campo de relación en la tabla principal
);

/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array("field" => "fecha","label"=> $smarty->config_vars["table_fecha"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_proyecto_financiador_id"]
, "table_as"=> "of", "as" => "proyecto_financiador_id");

$grid_item[]=array("field" => "monto","label"=> $smarty->config_vars["table_monto"]);
$grid_item[]=array("field" => "detalle","label"=> $smarty->config_vars["table_detalle_transferencia"]);

$grid_item[]=array("field"=> "attached_name","label"=> $smarty->config_vars["table_attached_name"]);
$grid_item[]=array("field" => "attached_size","label"=> $smarty->config_vars["table_attached_size"]);

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
    "table" => $appVars["table"] ["proyecto_financiador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "pf" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"proyecto_financiador_id" //Campo de relación en la tabla principal
);

$grid_table[] = array(
    "table" => $appVars["table"] ["organismo_financiador"] // Nombre de la tabla con la que hara la relación
,    "alias"=> "of" //Alias de la tabla para el join
,   "field_id"=>"id" //Id de la tabla que hara la relación
,   "relationship_id"=>"pf.organismo_financiador_id" //Campo de relación en la tabla principal
);

/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array("field" => "fecha","label"=> $smarty->config_vars["table_fecha"]);

$grid_item[]=array( "field" => "nombre", "label"=> $smarty->config_vars["table_proyecto_financiador_id"]
, "table_as"=> "of", "as" => "proyecto_financiador_id");

$grid_item[]=array("field" => "monto","label"=> $smarty->config_vars["table_monto"]);
$grid_item[]=array("field" => "detalle","label"=> $smarty->config_vars["table_detalle_transferencia"]);

$grid_item[]=array("field"=> "attached_name","label"=> $smarty->config_vars["table_attached_name"]);
$grid_item[]=array("field" => "attached_size","label"=> $smarty->config_vars["table_attached_size"]);

$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);

$group = "index_02";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
/*---------------------------------------------------------------------------------------------------------------------*/