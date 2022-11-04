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

$field_item["cod_are"]=array("type"=>"text");
$field_item["cod_proy"]=array("type"=>"text");
$field_item["cod_conv"]=array("type"=>"text");

$field_item["tipo_proyecto_id"]=array("type"=>"text");
$field_item["gestion"]=array("type"=>"text");
$field_item["emblematico"]=array("type"=>"checkbox_02");


$field_item["sisin"]=array("type"=>"text");
$field_item["sisin_fecha"]=array("type"=>"date_01");
$field_item["sisin_fecha_fin"]=array("type"=>"date_01");

$field_item["macroregion_id"]=array("type"=>"text");
// Ejecutor - Uno o mas
// Pueblos indígenas - Uno o mas

$field_item["fecha_inicio"]=array("type"=>"date_01");
$field_item["fecha_fin_inicial"]=array("type"=>"date_01");
//$field_item["fecha_fin_ampliacion"]=array("type"=>"date_01");
//$field_item["fecha_conclusion"]=array("type"=>"date_01");


$field_item["familias_beneficiarias_directa"]=array("type"=>"text");
$field_item["familia_beneficiarias_directa_mujeres"]=array("type"=>"text");
$field_item["familia_beneficiarias_directa_hombres"]=array("type"=>"text");

$field_item["familias_beneficiarias_indirecta"]=array("type"=>"text");
$field_item["familia_beneficiarias_indirecta_mujeres"]=array("type"=>"text");
$field_item["familia_beneficiarias_indirecta_hombres"]=array("type"=>"text");

//$field_item["familia_beneficiarias_total"]=array("type"=>"text");

$field_item["generacion_empleo_directa"]=array("type"=>"text");
$field_item["generacion_empleo_indirecta"]=array("type"=>"text");
$field_item["generacion_empleo_total"]=array("type"=>"text");


$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
