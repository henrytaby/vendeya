{literal}
<script>
    var table_list;
    var snippet_list = function() {
        "use strict";
        var urlsys = '{/literal}{$path_url}/{$subcontrol}_/{$id}{literal}';

        var initTable = function() {
            let table_list_var = $('#tabla_{/literal}{$subcontrol}{literal}');
            let export_title = "{/literal}{#dataTableExportTitle#}{literal}";
            let noExport = tableSetting.noExport;
            table_list = table_list_var.DataTable({
                initComplete: function(settings, json) {
                    table_list_var.removeClass('d-none');
                },
                drawCallback: function( settings ) {
                    get_resumen();
                    table_list_var.removeClass('d-none');
                },
                keys: {
                    columns: noExport,
                    clipboard: false,
                },
                //dom: tableSetting.dom,
                dom:
                    `<'row'<'col-sm-12 col-md-12 dataTables_pager'lp>>
                <'row'<'col-sm-12'tr>>
                <'row'<'col-sm-12 col-md-5'i>>`,
                buttons: [
                    {extend:'colvis',text:lngUyuni.dataTableWatch
                        ,columnText: function ( dt, idx, title ) {
                            return (idx+1)+': '+title;
                        }
                    },
                    {extend:'excelHtml5'
                        ,exportOptions: {columns: noExport}
                        , title: export_title
                    },
                    {extend:'pdfHtml5'
                        ,exportOptions: {columns: noExport}
                        , title: export_title
                        , download: 'open'

                        , pageSize: 'LETTER'
                        ,customize: function(doc) {
                            doc.styles.tableHeader.fontSize = 7;
                            doc.defaultStyle.fontSize = 7;
                            doc.pageMargins= [ 20, 20];
                        }
                    },
                    {extend:'print'
                        ,exportOptions: {columns: noExport}
                        ,text: lngUyuni.dataTablePrint
                    }

                ],
                colReorder: true,
                responsive: true,
                language: {"url": "/language/js/datatable."+lng+".json"},
                lengthMenu: [[10, 25, 50,-1], [10, 25, 50, lngUyuni.dataTableAll]],
                pageLength: 25,
                order: [[ 0, "asc" ]], // Por que campo ordenara al momento de desplegar
                InfoFiltered: false,
                searchDelay: 500,
                processing: true,
                serverSide: true,
                ajax: {
                    url: urlsys+'/list',
                    type: 'POST',
                    data: {},
                },
                columns: [
                    {/literal}{foreach from=$gridItem item=row key=idx}
                    {if $idx != 0},{/if}{literal}{data: '{/literal}{if $row.as}{$row.as}{else}{$row.field}{/if}{literal}'{/literal}{if $row.responsive}, responsivePriority: -1{/if}{literal}}{/literal}
                    {/foreach}{literal}
                ],

                /*
                rowGroup: {
                    dataSrc: ['proyecto_transferencia_id']
                },

                 */
                columnDefs: [
                    {
                        targets: -1,
                        width: "90px",
                        className: 'noExport',
                        orderable: false,
                        searchable: false,
                        render: function(data, type, full, meta) {
                            var boton = '<div class="btn-group btn-group-sm " role="group" aria-label="Accion">';
                            var lbEdit = {/literal}{if $privFace.edit == 1}lngUyuni.btnEdit{else}lngUyuni.btnViewData{/if}{literal};
                            boton += '<a href="javascript:snippet_list.update(\''+data+'\');" class="btn btn-success btn-sm" title="'+lbEdit+'">'+lbEdit+'</a>';
                            {/literal}{if $privFace.edit ==1 and $privFace.delete == 1}{literal}
                            boton += '<a href="javascript:snippet_list.delete(\''+data+'\');" class="btn btn-icon btn-light-danger btn-sm" title="'+lngUyuni.btnDelete+'"><i class="flaticon-delete-1"></i></a>';
                            {/literal}{/if}{literal}
                            boton += '<div>';
                            return boton;
                        },
                    },

                    {
                        targets: [4],
                        render: function(data,type,full,meta){
                            var download = "";
                            if(data) {
                                download = ' <a href="javascript:snippet_list.download(\''+full.actions+'\');"  ' +
                                    'class="btn btn-icon btn-circle btn-s btn-light-success">' +
                                    '<i class="fas fa-cloud-download-alt"></i></a> <span class="font-size-s">' + data+'</span>';
                            }
                            return download;
                        },
                    },

                    {
                        targets: [5],
                        render: function(data,type,full,meta){
                            //return '<span style="color: #7708bd;">' + new Intl.NumberFormat('en-US',{ minimumFractionDigits: 0 }).format(data) + ' </span>';
                            var size_file = "";
                            if(data) {
                                var size = parseInt(data);
                                size =  (size / (1024*1024)).toFixed(2);
                                size_file = '<span style="color: #517e03;" class="font-size-xs">' + size+' Mb.</span>';
                            }
                            return size_file;
                        },
                    },
                    {
                        targets: [2],
                        searchable: false,
                        render: function(data,type,full,meta){
                            if (data == null){ data = "0";}
                            return '<div class="text-info text-right">' + new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(data) + ' Bs. </div>';
                        },
                    },
                    {
                        targets: [-2,-3],
                        className: "none",
                        searchable: false,
                        render: function(data,type,full,meta){
                            if (data == null){ data = "";}
                            return '<span class="text-primary font-size-xs">' + data+ '</span>';
                        },
                    },


                ],
            });

        };
        /**
         * Download File
         */
        function download(id){
            var url = urlsys+"/"+id+"/download";
            window.open(url, '_blank');
        }

        /**
         * New and Update
         */
        var btn_update = $('#btn_form_{/literal}{$subcontrol}{literal}');
        var handle_button_update = function(){
            btn_update.click(function(e){
                e.preventDefault();
                item_update("","new");
            });
        };

        var item_update = function(id,type){
            var subcontrol = "{/literal}{$subcontrol}{literal}";
            coreUyuni.itemUpdateTabs(id,type,urlsys,subcontrol);
        };
        /**
         * Delete
         */
        var  item_delete = function(id){
            var url = urlsys+"/"+id+"/delete";
            coreUyuni.itemDelete(id,url,table_list);
        };
        /**
         * Inicializar componentes
         */
        var handle_components = function(){
            coreUyuni.setComponents();
        };
        /**
         * Filtros
         */
        var handle_filtro = function () {
            coreUyuni.tableFilter();
            $('.fitrodato').on('change',function(){
                filtroInicial();
            });
        };

        var entidad_opt = $("#entidad");
        var entidad = entidad_opt.val();
        entidad = entidad==null? '': entidad.toString();
        let principal_seguimiento = $('#principal_seguimiento');


        var filtroInicial = function () {
            entidad = entidad_opt.val();
            entidad = entidad==null? '': entidad.toString();
            //console.log(entidad);
            let table_list_var = $('#tabla_{/literal}{$subcontrol}{literal}');
            table_list_var.addClass('d-none');
            let table_list_var_01 = $('#tabla_01_{/literal}{$subcontrol}{literal}');
            table_list_var_01.addClass('d-none');



            if(entidad==0){
                principal_seguimiento.addClass('d-none');
                //botones_seguimiento.addClass('d-none');
                //get_avance_fisico_meta();
            }else{
                principal_seguimiento.removeClass('d-none');
                //botones_seguimiento.removeClass('d-none');
            }


            if(entidad!=0){
                let url = urlsys+'/list';
                url += "?filter[entidad]="+entidad;
                table_list.ajax.url( url ).load();
                let url_01 = url+"&numTable=1";
                table_list_01.ajax.url( url_01 ).load();
            }

        };

        var get_resumen = function(){
            //let entidad = snippet_list.get_entidad();
            var url = urlsys+"/get.resumenorgfinanciador?entidad="+entidad;
            $('#resumen_organismo_financiador').load(url);
        }

        var get_entidad= function (){
            ///console.log("Recupera :"+entidad)
            return entidad;
        }
        var get_resumen = function(){
            let entidad = snippet_list.get_entidad();
            var url = urlsys+"/get.resumenorgfinanciador?entidad="+entidad;
            $('#resumen_organismo_financiador').load(url);
        }
        return {
            //main function to initiate the module
            init: function() {
                handle_button_update();
                initTable();
                handle_components();
                handle_filtro();
            },
            update: function(id,type){
                item_update(id,"update");
            },
            delete: function(id){
                item_delete(id);
            },
            download: function (id) {
                download(id);
            },
            get_entidad: function () {
                return get_entidad();
            },
        };
    }();

    jQuery(document).ready(function() {
        snippet_list.init();
    });
</script>

{/literal}