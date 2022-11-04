<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */
$fields = array();
/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();

$field_item["organismo_financiador_id"]=array("type"=>"text");
$field_item["aporte_financiero"]=array("type"=>"text");
$field_item["aporte_nofinanciero"]=array("type"=>"text");
$field_item["porcentaje"]=array("type"=>"text");
$field_item["descripcion"]=array("type"=>"text");

//$field_item["active"]=array("type"=>"checkbox_02");
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

$field_item["total"]=array("type"=>"text");
$field_item["detalle"]=array("type"=>"text");

$group = "index_01";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Formulario 2
 */
$field_item = array();
//$field_item["total"]=array("type"=>"text");
$field_item["detalle"]=array("type"=>"text");
$field_item["programa_convenio_id"]=array("type"=>"text");

$group = "index_02";
$fields[$group]= $field_item;
unset($field_item);