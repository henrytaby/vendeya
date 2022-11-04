<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */
$fields = array();
/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();

$field_item["programa_convenio_financiador_id"]=array("type"=>"text");
$field_item["programa_convenio_tipo_financiamiento_id"]=array("type"=>"text");
$field_item["descripcion"]=array("type"=>"text");
$field_item["moneda_id"]=array("type"=>"text");
$field_item["monto"]=array("type"=>"text");
$field_item["monto_bs"]=array("type"=>"text");

$group = "index";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Apartir de aca, puedes configurar otros campos
 */
