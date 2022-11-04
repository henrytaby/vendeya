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
$db_table[] = Core::getTableConfig("tipo_proyecto");

$db_table[] = Core::getTableConfig("ejecutor");
$db_table[] = Core::getTableConfig("contraparte_responsable");

$db_table[] = Core::getTableConfig("organismo_financiador_tipo");
$db_table[] = Core::getTableConfig("organismo_financiador");
$db_table[] = Core::getTableConfig("actividad_tipo");
$db_table[] = Core::getTableConfig("actividad_unidad");
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
