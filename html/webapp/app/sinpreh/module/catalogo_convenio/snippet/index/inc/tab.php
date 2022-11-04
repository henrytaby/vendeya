<?PHP
/**
 * Configuración de los tabs a utilizarse en el snippet
 */

$tabs = array();
\Core\Core::setLenguage("tabItem"); //cargamos idioma

/**
 * Realizamos la configuración de los taps para cada grupo que utilicemos
 */
//-------------------------------------------------------------

$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_convenio_moneda"]
,   "id_name"=>"conveniomoneda"
,   "icon" => "fas fa-coins m--font-success"
,   "new" => 1
);
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_convenio_financiador"]
,   "id_name"=>"conveniofinanciador"
,   "icon" => "fas fa-comment-dollar m--font-success"
,   "new" => 1
);
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_convenio_implementador"]
,   "id_name"=>"convenioimplementador"
,   "icon" => "fas fa-file-alt m--font-success"
,   "new" => 1
);
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_convenio_tipo"]
,   "id_name"=>"conveniotipo"
,   "icon" => "fas fa-copy m--font-success"
,   "new" => 1
);
//-------------------------------------------------------------
/**
 * Se añade el arreglo de tabs configurada a $tabs
 */
$group = "index";
$tabs[$group]= $item_tab;
unset($item_tab); // siempre se borrar la variable para iniciar una nueva configuración

/**
 * A partir de aca puede añadir todos los grupos de tabs que sean necesarias para esta vista
 */
