<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */
$fields = array();
/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();

$field_item["proyecto_actividad_id"]=array("type"=>"text");
$field_item["total"]=array("type"=>"text");
$field_item["fecha"]=array("type"=>"date_01");
$field_item["detalle"]=array("type"=>"text");

$group = "index";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Apartir de aca, puedes configurar otros campos
 */

