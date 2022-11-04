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


$db_table = array();
$dbSchemaName = "catalogo";
$db_table[] = Core::getTableConfig("programa_norma");
$db_table[] = Core::getTableConfig("programa_sector");
$db_table[] = Core::getTableConfig("programa_convenio_financiador");
$db_table[] = Core::getTableConfig("programa_convenio_tipo_financiamiento");
$db_table[] = Core::getTableConfig("programa_convenio_moneda");
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
