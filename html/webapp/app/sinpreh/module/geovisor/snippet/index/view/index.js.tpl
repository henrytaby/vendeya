<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYOLt6GKV-5_FGHg_gWVU4R1gU_oCc3G8"></script>
<script src="/js/geo/leaflet.1.7.1/leaflet.js"></script>




<script src="/js/geo/leaflet.spin/example/spin/dist/spin.min.js"></script>
<script src="/js/geo/leaflet.spin/leaflet.spin.min.js"></script>

<script src="/js/geo/leaflet.sidebar-v2/js/leaflet-sidebar.js"></script>


<script src="/js/geo/leaflet.extramarkers/dist/js/leaflet.extra-markers.js">

<script src="/js/geo/leaflet.fullscreen/Control.FullScreen.js"></script>
<script src="/js/geo/Leaflet.GoogleMutant.js"></script>

<script src="/js/geo/leaflet.ajax/dist/leaflet.ajax.js"></script>
<script src="/js/geo/leaflet.ajax/example/spin.js"></script>

<!--script src="/js/geo/leaflet.groupedlayercontrol/dist/leaflet.groupedlayercontrol.min.js"></script-->
<script src="/js/geo/leaflet.panel-layers/dist/leaflet-panel-layers.min.js"></script>
<script src="/js/geo/leaflet.wms/dist/leaflet.wms.js"></script>
<script src="/js/geo/leaflet.minimap/dist/Control.MiniMap.min.js"></script>
<script src="/js/geo/leaflet.control.custom/Leaflet.Control.Custom.js"></script>

<script src="/js/chart.js/Chart.min.js"></script>


{literal}
<script>
    var filtro_var="";
    var filtro_departamento, filtro_programa;
    var filtro_estado,filtro_gd_tipo_fuente_generacion;
    var urlsys = '{/literal}{$path_url}{literal}';
    var urljson = urlsys+'/get.point';

    var json_layer;
    var recargar;



    var snippet_tab_item = function () {
        var borra_contenido_tabs = function () {
            {/literal}
            {foreach from=$menu_tab item=row key=idx}
            $("#{$row.id_name}_pane").html("");
            {/foreach}
            {literal}
            reset_estado();
        };
        var handler_tab_build = function(){
            $('[data-toggle="tabajax"]').click(function(e) {
                e.preventDefault();
                var $this = $(this),
                    loadurl = $this.attr('data-href') + filtro_var,
                    targ = $this.attr('data-target');
                id_name =targ;
                targ = "#"+targ+"_pane";
                //Vaciamos el tab
                recargar = 0;
                switch(id_name) {
                {/literal}
                {foreach from=$menu_tab item=row key=idx}
                    case '{$row.id_name}':
                        if ({$row.id_name}_var ==0){
                            {$row.id_name}_var =1;
                            recargar = 1;
                        }
                        break;
                {/foreach}
                {literal}
                }

                if(recargar==1){
                    borra_contenido_tabs();
                    cargando = "<div style='text-align: center;padding-top: 50px;'>Cargando datos...</div>";
                    $(targ).html(cargando);
                    $.get(loadurl, function(data) {
                        $(targ).html(data);
                    });

                    switch(id_name) {
                    {/literal}
                    {foreach from=$menu_tab item=row key=idx}
                        case '{$row.id_name}':
                            {$row.id_name}_var =1;
                            break;
                    {/foreach}
                    {literal}
                    }
                }

                return false;
            });
        };


        {/literal}
        {foreach from=$menu_tab item=row key=idx}
        var {$row.id_name}_var;
        {/foreach}
        {literal}


        var reset_estado = function(){
            {/literal}
            {foreach from=$menu_tab item=row key=idx}
            {$row.id_name}_var = 0;
            {/foreach}
            {literal}
        };

        return {
            init: function() {
                handler_tab_build();
                reset_estado();
            },
            reset_estado: function () {
                reset_estado();
            }
        };
    }();



    var map;
    var snippet_geovisor = function () {

        var map_default_center = [-17.403918, -64.354500];
        var map_default_zoom= 6;
        var geoserver_mmaya = '/geoserver/wms';
        var layer_departamento,layer_municipio;
        var uh_nivel1,uh_nivel2,uh_nivel3,uh_nivel4,uh_nivel5, macroregion,cuencas_operativas;

        /**
         * configuración de variables de los departamentos segun geoserver para geosiarh
         */

        var departamento_geo = {
            "2": "Beni",
            "9": "Chuquisaca",
            "1": "Cochabamba",
            "3": "La Paz",
            "6": "Oruro",
            "5": "Pando",
            "4": "Potosí",
            "8": "Santa Cruz",
            "7": "Tarija"
        };
        var iconByName = function(name) {
            return '<i class="icon icon-'+name+'"></i>';
        };
        var getBaseLayers = function(){
            Grayscale =  L.tileLayer(
                'https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                    maxZoom: 18,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                }),
                mapLink = '<a href="https://openstreetmap.org">OpenStreetMap</a>';
            osmLayer = L.tileLayer(
                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; ' + mapLink + ' Contributors',
                    maxZoom: 19,
                    id: 'osm'
                }).addTo(map);
            OpenTopoMap = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                maxZoom: 17,
                attribution: 'Map data: &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, <a href="https://viewfinderpanoramas.org">SRTM</a> | Map style: &copy; <a href="https://opentopomap.org">OpenTopoMap</a> (<a href="https://creativecommons.org/licenses/by-sa/3.0/">CC-BY-SA</a>)'
            });
            googleHybrid = L.gridLayer.googleMutant({
                maxZoom: 24,
                type: "hybrid", // valid values are 'roadmap', 'satellite', 'terrain' and 'hybrid'
            });

            var baseLayers = [{
                group: "Mapas Base",
                icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                collapsed: true,
                layers: [
                    { name: "Gray Scale", layer: Grayscale},
                    { name: "OpenStreetMap", layer: osmLayer},
                    { name: "OpenTopoMap", layer: OpenTopoMap},
                    { name: "Google Hybrid", layer: googleHybrid}
                    ]
            }];
            return baseLayers;
        };
        var getGroupedOverlays = function(){
            /**
             * Base
             */
            layer_departamento = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:departamento',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5,
                //styles:'siarh_geovisor_rojo'
            }).addTo(map);
            layer_municipio = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:municipio',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 1,
            });

            uh_nivel1 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:uh_nivel1',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });

            uh_nivel2 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:uh_nivel2',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            uh_nivel3 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:uh_nivel3',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            uh_nivel4 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:uh_nivel4',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            uh_nivel5 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:uh_nivel5',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            macroregion = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:macroregion',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });

            cuencas_operativas = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinpreh:51_cuencas_operativas',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            var overLayers =[
                {
                    group: "Administrativos",
                    collapsed: true,
                    className: "administrativos",
                    name: "grp-admin",
                    layers: [
                        {
                            active: true,
                            name: "Departamento",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: layer_departamento
                        },
                        {
                            active: true,
                            name: "Municipio",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: layer_municipio
                        }
                    ]
                }
                ,{
                    group: "Unidad Hidrográfica",
                    collapsed: true,
                    className: "unidadhidrografica",
                    name: "grp-uh",
                    layers: [
                        {
                            active: false,
                            name: "51 Cuencas_Operativas",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: cuencas_operativas
                        },
                        {
                            active: false,
                            name: "Macroregion",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: macroregion
                        },
                        {
                            active: false,
                            name: "UH Nivel5",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: uh_nivel5
                        },
                        {
                            active: false,
                            name: "UH Nivel4",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: uh_nivel4
                        },
                        {
                            active: false,
                            name: "UH Nivel3",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: uh_nivel3
                        },
                        {
                            active: false,
                            name: "UH Nivel2",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: uh_nivel2
                        },
                        {
                            active: false,
                            name: "UH Nivel1",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: uh_nivel1
                        },
                    ]
                },
            ];
            return overLayers;
        };


         var initialiseMap = function(){
            var mapOptions = {
                center: map_default_center//punto
                , zoom: map_default_zoom
                ,fullscreenControl: true
                ,scrollWheelZoom: true
            };
            var m = L.map('map',mapOptions);
            L.control.scale({metric: true, imperial: false}).addTo(m);
            return m;
        };

         var getIconStyle = function(cate,fuente){
             if(cate === null){
                 cate = 0;
             }
             var icons1 = [
                 { markerColor: '#a5a5a5'}, //nada *
                 { markerColor: 'purple'}, //CERRADO *
                 { markerColor: 'violet'}, //PARALIZADO *
                 { markerColor: '#ff00f0'}, //DEBITO *
                 { markerColor: 'green'}, //CONCLUIDO *
                 { markerColor: '#bf0101'}, //CANCELADO *
                 { markerColor: 'cyan'}, //EJECUCION *
                 { markerColor: 'yellow'}, //PROGRAMADO *
             ];
             var icons2 = [
                 { icon: 'fa-compress',shape: 'circle'}, //nada *
                 { icon: 'fa-lock',shape: 'circle'}, //CERRADO
                 { icon: 'fa-hand-paper',shape: 'circle'}, //PARALIZADO *
                 { icon: 'fa-fan',shape: 'square'}, //DEBITO
                 { icon: 'fa-check',shape: 'star'}, //CONCLUIDO *
                 { icon: 'fa-times-circle',shape: 'circle'}, //CANCELADO *
                 { icon: 'fa-thumbs-up',shape: 'star'}, //EJECUCION *
                 { icon: 'fa-clock',shape: 'penta'}, //PROGRAMADO *
             ];
             let resp = L.ExtraMarkers.icon({
                 //icon: icons2[fuente].icon,
                 icon: icons2[cate].icon,
                 markerColor: icons1[cate].markerColor,
                 shape: icons2[cate].shape,
                 svg:true,
                 prefix: 'fa'
             });
             return resp;
         };

        var createMap = function(){
            var mapDiv = $('#map');
            mapDiv.parent().addClass("p-0");
            $('#kt_content').addClass("p-0");



            map = initialiseMap();
            // Define a style

            json_layer = new L.GeoJSON.AJAX([urljson],{
                pointToLayer: function(point, latlng) {
                    //let ic = getIconStyle(point.properties["gd_categoria_id"],point.properties["gd_tipo_fuente_generacion_id"]);
                    let ic = getIconStyle(point.properties["estado_id"],2);
                    return L.marker(latlng, {icon: ic});
                },
                onEachFeature:popUp

            }).addTo(map);

            /**
             * Mini Mapa
             */
            var osmUrl='https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
            var osmAttrib='';
            var osm2 = new L.TileLayer(osmUrl, {minZoom: 0, maxZoom: 13, attribution: osmAttrib });
            var miniMap = new L.Control.MiniMap(osm2, {
                toggleDisplay: true,
                minimized: true,
                position: "bottomleft",
                //collapsedWidth: 25,
                //collapsedHeight: 25,
                //zoomLevelFixed: 3
            }).addTo(map);

            var sidebar = L.control.sidebar({ container: 'sidebar' }).addTo(map);

            /**
             * Geoserver
             */
            var options = {
                //compact: false,
                collapsibleGroups: !0,
                collapsed: !0,
                //title:"Mapas",
            };
            //layerControl = L.control.groupedLayers(getBaseLayers(), getGroupedOverlays(), options).addTo(map);
            var controlLayers = new L.Control.PanelLayers(getBaseLayers(), getGroupedOverlays(), options);
            map.addControl(controlLayers);
            //controlLayers._map = map;
            //var panelLayers = controlLayers.onAdd(map);
            //$('#vista_control_capas').append(panelLayers)
        };



        var popUp = function(f,l){
            var out = [];
            if (f.properties){
                let info = "";
                info += "<h2 class='titulo'>Cod Proy: "+f.properties["cod_proy"]+"</h2>";
                info += "<strong>Proyecto:</strong> <BR>"+ f.properties["nombre"]+"<strong> SISIN:</strong>"+f.properties["sisin"]+" ";
                out.push(info);

                out.push("<strong>Departamento:</strong> "+ f.properties["departamento"]);
                out.push("<strong>Municipio:</strong> "+ f.properties["municipio"]);
                out.push("<strong>Responsable:</strong> "+ f.properties["responsable"]);
                out.push("<strong>Observaciones:</strong> "+ f.properties["observaciones"]);
                out.push("<strong>Fecha Inicio:</strong> "+ f.properties["fecha_inicio"]);
                out.push("<strong>Fecha Fin Inicial:</strong> "+ f.properties["fecha_fin_inicial"]);
                out.push("<strong>Fecha Conclusion:</strong> "+ f.properties["fecha_conclusion"]);

                info ="";
                info +="<div class='titulo2'>Datos Financieros </div>";
                info +="<span class=''> Ejecutado Total: "+ new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(f.properties["ejecutado_total"])+"</span><br>";
                //info +="<span class=''>Tensión de servicio (V): "+ new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(f.properties["tension"])+"</span>";
                //info +="<div class=''>Tipo de conexión del suministro: "+ f.properties["tipo_conexion"]+"</div>";

                info +="<div class='titulo2'>Avance </div>";
                info +="<span class=''>Avance Financiero: "+ new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(f.properties["avance_financiero"])+"</span><br>";
                info +="<span class=''>Avance Físico: "+ new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(f.properties["avance_fisico"])+"</span><br>";
                //info +="<div class=''>Tipo de fuente de generación: "+ f.properties["tipo_fuente_generacion"]+"</div>";
                out.push(info);

                boton ="";
                boton += "<a style='margin-bottom: 5px;' href=\"javascript:snippet_geovisor.editGd("+f.properties["id"]+")\"  class=\"btn btn-success btn-sm mr-3\"><span><i class=\"flaticon-edit\"></i><span>Editar Proyecto</span></span></a> ";

                ubicacion ="";
                ubicacion += "<div class='ubicacion_titulo'>Ubicación:</div>";
                ubicacion += "<div class='ubicacion'>Latitud :"+ f.properties["location_latitude_decimal"];
                ubicacion += "/ Longitud:"+ f.properties["location_longitude_decimal"];
                ubicacion += "</div>";
                out.push(ubicacion);
                out.push(boton);
                l.bindPopup(out.join("<br />"));
            }
        };

        var editGd = function(id){
            url = "/sinpreh/proyecto/"+id;
            var win = window.open(url, '_blank');
            win.focus();
        }



        var handle_filtro = function () {
            $('.filtro-buscar').change(function(evt, params){
                filtro_accion();
            });
        };

        var get_filtros_var = function(){
            /**
             * recogemos los datos de los filtros
             */
            filtro_departamento =  $("#filtro_departamento").val();
            filtro_departamento = filtro_departamento==null? '': filtro_departamento.toString();

            filtro_estado =  $("#filtro_estado").val();
            filtro_estado = filtro_estado==null? '': filtro_estado.toString();

            filtro_gd_tipo_fuente_generacion =  $("#filtro_gd_tipo_fuente_generacion").val();
            filtro_gd_tipo_fuente_generacion = filtro_gd_tipo_fuente_generacion==null? '': filtro_gd_tipo_fuente_generacion.toString();

            /**
             * variables Get
             */
            filtro_var = "?filter[departamento]="+filtro_departamento+"&filter[filtro_estado]="+filtro_estado+"&filter[filtro_gd_tipo_fuente_generacion]="+filtro_gd_tipo_fuente_generacion;
        };

        var wmsGetDepartamentFilter = function(){
            var filtro_cql_str="";
            if (filtro_departamento=="") {
                filtro_cql_str = " name <> 'dato'";
            }else{
                filtro_cql_str = " id in ("+filtro_departamento+")";
            }
            return filtro_cql_str;
        };
        var wmsGetDepartamentFilterMunicipio = function(){
            var filtro_cql_str="";
            if (filtro_departamento=="") {
                filtro_cql_str = " name <> 'dato'";
            }else{
                filtro_cql_str = " departamento_id in ("+filtro_departamento+")";
            }
            return filtro_cql_str;
        };

        var filtro_accion = function(){
            get_filtros_var();
            snippet_tab_item.reset_estado();
            urljson_filter = urljson + filtro_var;
            json_layer.refresh(urljson_filter);
            /**
             * Para la capa de departamentos
             */
            filtro_cql_str =  wmsGetDepartamentFilter();
            layer_departamento.setParams({CQL_FILTER: filtro_cql_str });
            /**
             * Para la capa de municipio
             */
            filtro_cql_str =  wmsGetDepartamentFilterMunicipio();
            layer_municipio.setParams({CQL_FILTER: filtro_cql_str });

            handle_summary();
        };
        var handle_summary = function (){
            $.get( urlsys+'/get.summary',
                {
                    'item[departamento]': filtro_departamento
                    ,'item[filtro_estado]': filtro_estado
                    ,'item[filtro_gd_tipo_fuente_generacion]': filtro_gd_tipo_fuente_generacion
                },
                function(res){
                    $("#total").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.total)+" ");
                    $("#total_programado").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.programado)+" ");
                    $("#total_cerrado").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.cerrado)+" ");
                    $("#total_cancelado").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.cancelado)+" ");

                    $("#total_paralizado").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.paralizado)+" ");
                    $("#total_concluido").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.concluido)+" ");
                    $("#total_ejecucion").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.ejecucion)+" ");
                    $("#total_debito").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.debito)+" ");
                    $("#total_none").html(new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(res.none)+" ");
                },"json");
        };
        /**
         * Funcionalidades de botones
         */
        var setCenterMap = function() {
            map.flyTo(map_default_center, map_default_zoom);
        };

        var window_layers = $('#window_layers');

        var toolButtons = function () {
            /*
            $('#btn_center_map').click(function() {
                setCenterMap();
            });
             */
        };

        var handle_components = function(){
            coreUyuni.setComponents();
        };

        return {
            //main function to initiate the module
            init: function() {
                createMap();
                //toolButtons();
                //closeLayersWindow();

                handle_components();
                handle_filtro();
                handle_summary();
            },
            resumen:function() {
                resumen();
            },
            editGd:function(id){
                editGd(id);
            }

        };

    }();


    jQuery(document).ready(function() {
        snippet_geovisor.init();
        snippet_tab_item.init();
    });

</script>
{/literal}