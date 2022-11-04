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
$dbSchemaName = "core";
$db_table[] = Core::getTableConfig("user");
$db_table[] = Core::getTableConfig("user_module");
$db_table[] = Core::getTableConfig("app");
$db_table[] = Core::getTableConfig("app_group");
$db_table[] = Core::getTableConfig("app_module");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName);
unset($db_table);
unset($db_prefix);

/**
 * Otras base de datos
 */
$db_table = array();
$dbSchemaName = "public";
$db_table[] = Core::getTableConfig("distribuidor");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName,$appVars["table"] );
unset($db_table);
/* /
print_struc($appVars["table"] );
print_struc($CFG->table);
exit;
/**/
