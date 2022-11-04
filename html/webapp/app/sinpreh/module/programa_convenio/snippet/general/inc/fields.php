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

//*******
$field_item["programa_id"]=array("type"=>"text");
$field_item["nombre"]=array("type"=>"text");
$field_item["estado_id"]=array("type"=>"text");
//field_item["telefono"]=array("type"=>"checkbox_02");
$field_item["codigo"]=array("type"=>"text");
$field_item["fecha_firma"]=array("type"=>"date_01");
$field_item["fecha_aprobacion"]=array("type"=>"date_01");
$field_item["fecha_finalizacion"]=array("type"=>"date_01");
$field_item["fecha_max_ultimo_desembolso"]=array("type"=>"date_01");
$field_item["moneda_id"]=array("type"=>"text");
$field_item["financiador_id"]=array("type"=>"text");
$field_item["implementador_id"]=array("type"=>"text");
$field_item["tipo_financiamiento_id"]=array("type"=>"text");
$field_item["descripcion"]=array("type"=>"text");

$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
