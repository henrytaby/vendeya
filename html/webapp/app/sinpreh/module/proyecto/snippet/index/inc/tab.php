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
    "label"=> $smarty->config_vars["tabDatos"]
,   "id_name"=>"datos"
,   "icon" => "far fa-edit m--font-success"
,   "new" => 1
);

//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabGeneral"]
,   "id_name"=>"general"
,   "icon" => "far fa-file-alt m--font-success"
,   "new" => 0
);

//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabAmpliacion"]
,   "id_name"=>"ampliacion"
,   "icon" => "flaticon-share m--font-success"
,   "new" => 0
);

//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabUbicacion"]
,   "id_name"=>"ubicacion"
,   "icon" => "fas fa-map-marker m--font-success"
,   "new" => 0
);


//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabFinanciador"]
,   "id_name"=>"financiador"
,   "icon" => "fas fa-coins m--font-success"
,   "new" => 0
);
//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabAcciones"]
,   "id_name"=>"actividad"
,   "icon" => "fas fa-list-ul m--font-success"
,   "new" => 0
);
//-------------------------------------------------------------
/*
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabEstructurafinanciera"]
,   "id_name"=>"ubicacion"
,   "icon" => "flaticon-share m--font-success"
,   "new" => 0
);
*/
//-------------------------------------------------------------
/*
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabAvancefisico"]
,   "id_name"=>"ubicacion"
,   "icon" => "flaticon-share m--font-success"
,   "new" => 0
);
*/
//-------------------------------------------------------------
/*
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabAvancefinanciero"]
,   "id_name"=>"ubicacion"
,   "icon" => "flaticon-share m--font-success"
,   "new" => 0
);
*/

//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_adjunto"]
,   "id_name"=>"adjunto"
,   "icon" => "fas fa-paperclip m--font-success"
,   "new" => 0
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
