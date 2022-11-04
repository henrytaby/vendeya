{literal}
<script>
    var table_list;
    var snippet_list = function() {
        "use strict";
        var urlsys = '{/literal}{$path_url}/{$subcontrol}_/{$id}{literal}';
        let table_list_var = $('#tabla_{/literal}{$subcontrol}{literal}');
        let listametas = $('#listametas');
        let botones_seguimiento = $('#botones_seguimiento');
        var initTable = function() {
            let export_title = "{/literal}{#dataTableExportTitle#}{literal}";
            let noExport = tableSetting.noExport;
            table_list = table_list_var.DataTable({
                initComplete: function(settings, json) {
                    table_list_var.removeClass('d-none');
                },
                drawCallback: function( settings ) {
                    get_avance_fisico();
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
                        targets: [0],
                        render: function(data,type,full,meta){
                            return '<span class="text-primary">' + data+ '</span>';
                        },
                    },
                    {
                        targets: [1],
                        searchable: false,
                        render: function(data,type,full,meta){
                            if (data == null){ data = "0";}
                            return '<div class="text-success text-right">' + new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(data) + ' </div>';
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

        var meta = $("#meta").val();
        meta = meta==null? '': meta.toString();
        var filtroInicial = function () {
            meta = $("#meta").val();
            meta = meta==null? '': meta.toString();
            if(meta==0){
                listametas.addClass('d-none');
                botones_seguimiento.addClass('d-none');
                get_avance_fisico_meta();
            }else{
                listametas.removeClass('d-none');
                botones_seguimiento.removeClass('d-none');
            }

            if(meta!=0){
                let url = urlsys+'/list';
                url += "?filter[meta]="+meta;
                table_list.ajax.url( url ).load();
            }
        };

        /**
         * Total de avance físico
         */
        var get_avance_fisico = function(){
            var url = urlsys+"/get.avancefisico";
            $('#avance_fisico_total').load(url);
            get_avance_fisico_meta();
        }
        var get_avance_fisico_meta = function(){
            //console.log("----->Meta: "+meta);
            if(meta>0){
                var url = urlsys+"/get.avancefisicometa?meta="+meta;
                //console.log(url);
                $('#avance_fisico_meta').load(url);
            }else{
                $('#avance_fisico_meta').html("");
            }
        }

        var get_meta= function (){
            //console.log("entro a ver la meta de lista: "+meta);
            return meta;
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
            get_avance_fisico:function (id) {
                get_avance_fisico();
            },
            get_avance_fisico_meta:function (id) {
                get_avance_fisico_meta();
            },
            get_meta:function(){
                return get_meta();
            }
        };
    }();

    jQuery(document).ready(function() {
        snippet_list.init();
    });
</script>

{/literal}
