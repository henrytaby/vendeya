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
//*******Identificacion del consumidor rgula solicitante
$field_item["inversion_total_bs"]=array("type"=>"text");
$field_item["inversion_total_bs_mil"]=array("type"=>"text");
$field_item["externo_total_bs"]=array("type"=>"text");
$field_item["contraparte_local_total_bs"]=array("type"=>"text");

$field_item["bol_bs"]=array("type"=>"text");
$field_item["ppcr_bs"]=array("type"=>"text");

$field_item["gad_financiero_bs"]=array("type"=>"text");
$field_item["gad_nofinanciero_bs"]=array("type"=>"text");
$field_item["gam_financiero_bs"]=array("type"=>"text");
$field_item["gam_nofinanciero_bs"]=array("type"=>"text");

$field_item["uf_financiero_bs"]=array("type"=>"text");
$field_item["otro_financiero_bs"]=array("type"=>"text");
$field_item["contraparte_local_nofinanciero"]=array("type"=>"text");


//****************

$field_item["contraparte_responsable_id"]=array("type"=>"text");
$field_item["ejecutado_total"]=array("type"=>"text");

$field_item["ejecutado_pnc_bs"]=array("type"=>"text");
$field_item["ejecutado_bol_bs"]=array("type"=>"text");
$field_item["ejecutado_ppcr_bs"]=array("type"=>"text");
$field_item["ejecutado_gad_financiero_bs"]=array("type"=>"text");
$field_item["ejecutado_gad_nofinancier_bs"]=array("type"=>"text");
$field_item["ejecutado_gam_financiero_bs"]=array("type"=>"text");
$field_item["ejecutado_gam_nofinanciero_bs"]=array("type"=>"text");
$field_item["ejecutado_uf_financiero_bs"]=array("type"=>"text");
$field_item["ejecutado_uf_nofinanciero_bs"]=array("type"=>"text");
$field_item["ejecutado_otro_bs"]=array("type"=>"text");
$field_item["ejecutado_contraparte_local_nofinanciero_bs"]=array("type"=>"text");
$field_item["pnc_bs"]=array("type"=>"text");
$field_item["saldo_total_bs"]=array("type"=>"text");
$field_item["saldo_pnc_bs"]=array("type"=>"text");
$field_item["saldo_bol_bs"]=array("type"=>"text");
$field_item["saldo_ppcr_bs"]=array("type"=>"text");
$field_item["saldo_gad_financiero_bs"]=array("type"=>"text");

$field_item["saldo_gad_nofinanciero_bs"]=array("type"=>"text");
$field_item["saldo_gam_financiero_bs"]=array("type"=>"date_01");
$field_item["saldo_gam_nofinanciero_bs"]=array("type"=>"date_01");
$field_item["saldo_uf_financiero_bs"]=array("type"=>"date_01");

$field_item["saldo_uf_nofinanciero_bs"]=array("type"=>"text");
$field_item["saldo_otro_bs"]=array("type"=>"text");
$field_item["saldo_contraparte_local_nofinanciera_bs"]=array("type"=>"text");


$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
