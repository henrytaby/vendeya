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
    "label"=> $smarty->config_vars["tab_tipo_proyecto"]
,   "id_name"=>"tipoproyecto"
,   "icon" => "fas fa-file-alt m--font-success"
,   "new" => 1
);
/**
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_ejecutor"]
,   "id_name"=>"ejecutor"
,   "icon" => "fas fa-user-tie m--font-success"
,   "new" => 1
);
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_contraparte_responsable"]
,   "id_name"=>"contraparte"
,   "icon" => "fas fa-user-tag m--font-success"
,   "new" => 1
);

$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_organismo_financiador_tipo"]
,   "id_name"=>"tipoorganismo"
,   "icon" => "fas fa-window-restore m--font-success"
,   "new" => 1
);*/
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_organismo_financiador"]
,   "id_name"=>"organismofinanciador"
,   "icon" => "fas fa-window-restore m--font-success"
,   "new" => 1
);
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_actividad_tipo"]
,   "id_name"=>"tipometa"
,   "icon" => "fas fa-window-restore m--font-success"
,   "new" => 1
);
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_actividad_unidad"]
,   "id_name"=>"unidad"
,   "icon" => "fas fa-window-restore m--font-success"
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
