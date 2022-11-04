<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */
$fields = array();
/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();

$field_item["actividad_tipo_id"]=array("type"=>"text");
$field_item["nombre"]=array("type"=>"text");
$field_item["total"]=array("type"=>"text");
$field_item["actividad_unidad_id"]=array("type"=>"text");
$field_item["detalle"]=array("type"=>"text");
$group = "index";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Apartir de aca, puedes configurar otros campos
 */

/**
 * Formulario Actividad
 */
$field_item = array();
$field_item["nombre"]=array("type"=>"text");
$field_item["descripcion"]=array("type"=>"text");
$group = "addactividad";
$fields[$group]= $field_item;
unset($field_item);
/**
 * Formulario Unidad
 */
$field_item = array();
$field_item["nombre"]=array("type"=>"text");
$field_item["descripcion"]=array("type"=>"text");
$group = "addunidad";
$fields[$group]= $field_item;
unset($field_item);
