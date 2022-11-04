<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */

/**
 * Arreglos que se utilizaran en esta configuración para guardar los grupos de campos
 */
$fields = array();

/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();
$field_item["tipo_id"]=array("type"=>"text");

$field_item["numero_convenio"]=array("type"=>"text");
$field_item["gestion"]=array("type"=>"text");
$field_item["nombre"]=array("type"=>"text");

$field_item["vigencia_anios"]=array("type"=>"text");
$field_item["vigencia_mes"]=array("type"=>"text");
$field_item["vigencia_dias"]=array("type"=>"text");

$field_item["fecha_firma"]=array("type"=>"date_01");
$field_item["fecha_inicio"]=array("type"=>"date_01");
$field_item["fecha_conclusion"]=array("type"=>"date_01");
//$field_item["fecha_conclusion_enmienda"]=array("type"=>"date_01");


$field_item["convenio_vigencia_tipo_id"]=array("type"=>"text");
//$field_item["convenio_vigencia_fecha"]=array("type"=>"date_01");

$field_item["descripcion"]=array("type"=>"text");

$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
