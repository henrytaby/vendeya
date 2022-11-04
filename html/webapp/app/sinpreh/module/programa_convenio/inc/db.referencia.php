<?PHP
use Core\Core;
/**
 * Configuración de referncias de las tablas de las base de datos que utilizaremos en este módulo
 *
 */
$appVars["table"]  = array();
/**
 * Tablas de información principal, configuración de los objetos principales
 */

$db_prefix = ""; //prefijo de la base de datos
$db_table = array();
$dbSchemaName = "public";
$db_table[] = Core::getTableConfig("programa");
$db_table[] = Core::getTableConfig("programa_convenio");
$db_table[] = Core::getTableConfig("programa_convenio_enmienda");
$db_table[] = Core::getTableConfig("programa_convenio_archivo");

$db_table[] = Core::getTableConfig("programa_convenio_ejecutor");
$db_table[] = Core::getTableConfig("programa_convenio_financiador");

$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName);
unset($db_table);
unset($db_prefix);


$db_table = array();
$dbSchemaName = "catalogo";
$db_table[] = Core::getTableConfig("programa_convenio_estado");
$db_table[] = Core::getTableConfig("programa_convenio_financiador","","convenio_financiador");
$db_table[] = Core::getTableConfig("programa_convenio_moneda");
$db_table[] = Core::getTableConfig("programa_convenio_implementador");
$db_table[] = Core::getTableConfig("programa_convenio_tipo_financiamiento");
$db_table[] = Core::getTableConfig("moneda");

$db_table[] = Core::getTableConfig("ejecutor");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName,$appVars["table"] );
unset($db_table);

/**
 * Otras base de datos
 */

/* /
print_struc($appVars["table"] );
print_struc($CFG->table);
exit;
/**/
