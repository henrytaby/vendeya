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
/*$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_norma"]
,   "id_name"=>"norma"
,   "icon" => "fas fa-file-alt m--font-success"
,   "new" => 1
);
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_sector"]
,   "id_name"=>"sector"
,   "icon" => "flaticon-share m--font-success"
,   "new" => 1
);*/

$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_proyecto"]
,   "id_name"=>"proyecto"
,   "icon" => "fas fa-file-alt m--font-success"
,   "new" => 1
);


$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_areas"]
,   "id_name"=>"areas"
,   "icon" => "fas fa-file-alt m--font-success"
,   "new" => 1
);

$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_familia"]
,   "id_name"=>"familia"
,   "icon" => "fas fa-file-alt m--font-success"
,   "new" => 1
);
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_aporte"]
,   "id_name"=>"aporte"
,   "icon" => "fas fa-file-alt m--font-success"
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
