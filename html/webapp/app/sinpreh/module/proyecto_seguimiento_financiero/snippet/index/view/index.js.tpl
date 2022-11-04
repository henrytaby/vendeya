{literal}
<script>

    var table_list;
    var snippet_list = function() {
        "use strict";
        var urlsys = '{/literal}{$path_url}{literal}';
        var initTable = function() {
            let table_list_var = $('#index_list');
            let export_title = "{/literal}{#dataTableExportTitle#}{literal}";
            let noExport = tableSetting.noExport;
            // begin first table
            table_list = table_list_var.DataTable({
                initComplete: function(settings, json) {
                    $('#index_list').removeClass('d-none');
                },
                keys: {
                    columns: noExport,
                    clipboard: false,
                },
                dom: tableSetting.dom,
                buttons: [
                    /*
                    {extend:'colvis',text:lngUyuni.dataTableWatch
                        ,columnText: function ( dt, idx, title ) {
                            return (idx+1)+': '+title;
                        }
                    },

                     */
                    {extend:'excelHtml5'
                        ,exportOptions: {columns: noExport}
                        , title: export_title
                    },
                    {extend:'pdfHtml5'
                        ,exportOptions: {columns: noExport}
                        , title: export_title
                        , download: 'open'
                        , orientation: 'landscape'
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
                responsive: true,
                colReorder: true,
                language: {"url": "/language/js/datatable."+lng+".json"},
                lengthMenu: [[10, 25, 50,-1], [10, 25, 50, lngUyuni.dataTableAll]],
                pageLength: 25,
                //order: [[ 0, "asc" ],[ 1, "asc" ]], // Por que campo ordenara al momento de desplegar
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
                    dataSrc: ['programa']
                },*/
                columnDefs: [
                    {
                        targets: -1,
                        width: "60px",
                        className: 'noExport',
                        orderable: false,
                        searchable: false,
                        render: function(data, type, full, meta) {
                            var boton = '<div class="btn-group btn-group-sm " role="group" aria-label="Accion">';
                            var lbEdit = lngUyuni.btnTrackingData;
                            boton += '<a href="javascript:snippet_list.update(\''+data+'\');" class="btn btn-success btn-sm" title="'+lbEdit+'">'+lbEdit+'</a>';
                            boton += '<div>';
                            return boton;
                        },
                    },
                    {
                        targets: [2],
                        searchable: false,
                        width: '60px',
                        render: function(data, type, full, meta) {
                            var status = {
                                'false': { 'state': 'metal','label':'no'},
                                'true': { 'state': 'success','label':'si'}
                            };
                            if (typeof status[data] === 'undefined') {
                                return data;
                            }
                            return '<div class="text-center"><i class="fa fa-check-double text-' + status[data].state + '"></i> <span class="d-none" style="font-size:1px;">'+status[data].label+'</span></div>';
                        },
                    },

                    {
                        targets: 3,
                        //orderData: [ 0, 3 ],
                        width: '100px',
                        render: function(data, type, full, meta) {
                            var status = {
                                'CERRADO': {'title': 'CERRADO', 'color': '#440444'},
                                'PARALIZADO': {'title': 'PARALIZADO', 'color': '#90278d'},
                                'DEBITO': {'title': 'DEBITO', 'color': '#ff00f0'},
                                'CONCLUIDO': {'title': 'CONCLUIDO', 'color': '#006838'},
                                'CANCELADO': {'title': 'CANCELADO', 'color': '#bf0101'},
                                'EN EJECUCION': {'title': 'EN EJECUCION', 'color': '#32a9dd'},
                                'PROGRAMADO': {'title': 'PROGRAMADO', 'color': '#f5bb39'},
                            };
                            if (typeof status[data] === 'undefined') {
                                return data;
                            }
                            return '<div class="text-right"><span class="label label-lg font-weight-bold text-white label-inline" style="background:'+status[data].color +';">' + status[data].title + '</span></div>';
                        },
                    },
                    {
                        targets: 4,
                        width: '60px',
                        render: function(data, type, full, meta) {
                            var status = {
                                'Inversión': {'title': 'Inversión', 'color': '#90278d'},
                                'PreInversión': {'title': 'PreInversión', 'color': '#32a9dd'},
                            };
                            if (typeof status[data] === 'undefined') {
                                return data;
                            }
                            return '<div class="text-right"><span class="label label-lg font-weight-bold text-white label-inline" style="background:'+status[data].color +';">' + status[data].title + '</span></div>';
                        },
                    },
                    {
                        targets: [7],
                        searchable: false,
                        render: function(data,type,full,meta){
                            if (data == null){ data = "0";}
                            return '<div class="text-primary text-right">' + data+ ' %</div>';
                        },
                    },

                    {
                        targets: [8],
                        searchable: false,
                        width: "150px",
                        //className:"",
                        render: function(data,type,full,meta){
                            if (data == null){ data = "0";}
                            //return '<div class="text-primary text-right">' + data+ ' %</div>';
                            let res = '<div class="d-flex flex-column w-100 mr-2"><div class="d-flex align-items-center justify-content-between mb-2">'+
                                '<span class="text-muted mr-2 font-size-sm font-weight-bold">'+data+' %</span>'+
                                '<span class="text-muted font-size-sm font-weight-bold"></span></div>'+
                                '<div class="progress progress-xs w-100"><div class="progress-bar bg-info" role="progressbar" style="width: '+data+'%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>'+
                                '</div></div>';
                            return res;
                        },
                    },

                    {
                        targets: [2,6,10],
                        searchable: false,
                    },

                    {
                        targets: [2,-4,-5,-6,-8,-9,-10],
                        className: "none"
                    },
                    {
                        targets: [-2,-3],
                        searchable: false,
                        className: "none",
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
        //var btn_update = $('#btn_update');
        var btn_update = $('#btn_new');
        var handle_button_update = function(){
            btn_update.click(function(e){
                e.preventDefault();
                item_update("","new");
            });
        };

        var item_update = function(id,type){
            coreUyuni.itemUpdateIndex(id,type,urlsys);
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
        };

        return {
            //main function to initiate the module
            init: function() {
                initTable();
                handle_button_update();
                handle_components();
                handle_filtro();
            },
            update: function(id,type){
                item_update(id,type);
            },

        };

    }();

    jQuery(document).ready(function() {
        //$('#btn_new').removeClass('d-none');
        snippet_list.init();
    });
</script>
{/literal}