{literal}
<script>
    var table_list_01;

    var snippet_list_01 = function() {
        "use strict";
        var urlsys = '{/literal}{$path_url}/{$subcontrol}_/{$id}{literal}';
        var numTable = 1;

        var initTable = function() {

            let table_list_var = $('#tabla_01_{/literal}{$subcontrol}{literal}');
            let export_title = "{/literal}{#dataTableExportTitle_01#}{literal}";
            let noExport = tableSetting.noExport;
            table_list_01 = table_list_var.DataTable({
                initComplete: function(settings, json) {
                    table_list_var.removeClass('d-none');
                },
                drawCallback: function( settings ) {
                    get_resumen();
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
                    data: {numTable:numTable},

                },
                columns: [
                    {/literal}{foreach from=$gridItem_01 item=row key=idx}
                    {if $idx != 0},{/if}{literal}{data: '{/literal}{if $row.as}{$row.as}{else}{$row.field}{/if}{literal}'{/literal}{if $row.responsive}, responsivePriority: -1{/if}{literal}}{/literal}
                    {/foreach}{literal}
                ],

                rowGroup: {
                    dataSrc: ['proyecto_transferencia_id']
                },

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
                            boton += '<a href="javascript:snippet_list_01.update(\''+data+'\');" class="btn btn-success btn-sm" title="'+lbEdit+'">'+lbEdit+'</a>';
                            {/literal}{if $privFace.edit ==1 and $privFace.delete == 1}{literal}
                            boton += '<a href="javascript:snippet_list_01.delete(\''+data+'\');" class="btn btn-icon btn-light-danger btn-sm" title="'+lngUyuni.btnDelete+'"><i class="flaticon-delete-1"></i></a>';
                            {/literal}{/if}{literal}
                            boton += '<div>';
                            return boton;
                        },
                    },

                    {
                        targets: [1,4],
                        "visible": false
                    },
                    {
                        targets: [7],
                        render: function(data,type,full,meta){
                            var download = "";
                            if(data) {
                                download = ' <a href="javascript:snippet_list_01.download(\''+full.actions+'\');"  ' +
                                    'class="btn btn-icon btn-circle btn-s btn-light-success">' +
                                    '<i class="fas fa-cloud-download-alt"></i></a> <span class="font-size-s">' + data+'</span>';
                            }
                            return download;
                        },
                    },

                    {
                        targets: [8],
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
                        targets: [3],
                        searchable: false,
                        render: function(data,type,full,meta){
                            if (data == null){ data = "";}
                            if (full.financiamiento_codigo == null){ full.financiamiento_codigo = "";}
                            return '<span class="text-primary">' + data + ' - ' + full.financiamiento_codigo + '</span>';
                        },
                    },

                    {
                        targets: [5],
                        searchable: false,
                        render: function(data,type,full,meta){
                            if (data == null){ data = "0";}
                            return '<div class="text-info text-right">' + new Intl.NumberFormat('en-US',{ minimumFractionDigits: 2 }).format(data) + ' Bs. </div>';
                        },
                    },

                    {
                        targets: [6],
                        className: "none",
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
            var url = urlsys+"/"+id+"/download?numTable="+numTable;
            window.open(url, '_blank');
        }
        /**
         * New and Update
         */
        var btn_update = $('#btn_form_01_{/literal}{$subcontrol}{literal}');
        var handle_button_update = function(){
            btn_update.click(function(e){
                e.preventDefault();
                item_update("","new");
            });
        };

        var item_update = function(id,type){
            var subcontrol = "{/literal}{$subcontrol}{literal}";
            itemUpdateTabs(id,type,urlsys,subcontrol);
        };

        var itemUpdateTabs = function (id,type,url,subcontrol) {
            var load_url = url;
            if(type=='update'){
                load_url += '/'+id+'/?numTable='+numTable;
            }else{
                load_url += '/new?numTable='+numTable;
            }
            let cargando = lngUyuni.loading+'...'+cargando_vista;
            $("#modal-content_"+subcontrol).html(cargando);
            $("#form_modal_"+subcontrol).modal("show");
            $.get(load_url, function(data) {
                $("#modal-content_"+subcontrol).html(data);
            });
        };

        /**
         * Delete
         */
        var  item_delete = function(id){
            var url = urlsys+"/"+id+"/delete?numTable="+numTable;
            coreUyuni.itemDelete(id,url,table_list_01);
        };

        var get_resumen = function(){
            var url = urlsys+"/get.resumenorgfinanciador";
            $('#resumen_organismo_financiador').load(url);
        }

        return {
            //main function to initiate the module
            init: function() {
                handle_button_update();
                initTable();
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
        };
    }();

    jQuery(document).ready(function() {
        snippet_list_01.init();
    });
</script>

{/literal}
