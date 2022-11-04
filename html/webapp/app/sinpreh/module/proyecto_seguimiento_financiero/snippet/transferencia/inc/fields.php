<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */
$fields = array();
/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();
$field_item["proyecto_transferencia_id"]=array("type"=>"text");
$field_item["proyecto_financiador_id"]=array("type"=>"text");
$field_item["proyecto_programa_convenio_id"]=array("type"=>"text");
$field_item["fecha"]=array("type"=>"date_01");
$field_item["monto"]=array("type"=>"text");
$field_item["detalle"]=array("type"=>"text");

$group = "index";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Apartir de aca, puedes configurar otros campos
 */
/**
 * Formulario 1
 */
$field_item = array();

$field_item["proyecto_transferencia_id"]=array("type"=>"text");
$field_item["proyecto_financiador_id"]=array("type"=>"text");
$field_item["proyecto_programa_convenio_id"]=array("type"=>"text");
$field_item["fecha"]=array("type"=>"date_01");
$field_item["monto"]=array("type"=>"text");
$field_item["detalle"]=array("type"=>"text");

$group = "index_01";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Formulario 2
 */
$field_item = array();

$field_item["proyecto_transferencia_id"]=array("type"=>"text");
$field_item["proyecto_financiador_entidad_id"]=array("type"=>"text");
$field_item["proyecto_programa_convenio_id"]=array("type"=>"text");
$field_item["fecha"]=array("type"=>"date_01");
$field_item["monto"]=array("type"=>"text");
$field_item["detalle"]=array("type"=>"text");

$group = "index_02";
$fields[$group]= $field_item;
unset($field_item);