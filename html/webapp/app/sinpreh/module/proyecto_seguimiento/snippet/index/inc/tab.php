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
    "label"=> $smarty->config_vars["tab_fisico"]
,   "id_name"=>"fisico"
,   "icon" => "fas fa-check m--font-success"
,   "new" => 1
);
//-------------------------------------------------------------
/*
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabMontos"]
,   "id_name"=>"financiamiento"
,   "icon" => "flaticon-share m--font-success"
,   "new" => 0
);
*/




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
