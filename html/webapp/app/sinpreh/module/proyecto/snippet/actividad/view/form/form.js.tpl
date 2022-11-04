{literal}
<script>
    var snippet_form_{/literal}{$subcontrol}{literal} = function() {
        "use strict";
        let form = $('#form_{/literal}{$subcontrol}{literal}');
        let btn_submit = $('#form_submit_{/literal}{$subcontrol}{literal}');
        let btn_close = $('#form_close_{/literal}{$subcontrol}{literal}');
        let pmodal = $("#form_modal_{/literal}{$subcontrol}{literal}");

        var urlsys = '{/literal}{$path_url}/{$subcontrol}_{literal}';
        var formv;
        /**
         * Antes de enviar el formulario se ejecuta la siguiente funcion
         */
        var showRequest= function(formData, jqForm, op) {
            btn_submit.addClass('spinner spinner-white spinner-right').attr('disabled', true);
            btn_close.attr('disabled', true);
            return true;
        };
        var showResponse = function (res, statusText) {
            coreUyuni.itemFormShowResponse(res,pmodal,table_list);
            btn_close.attr('disabled', false);
            btn_submit.removeClass('spinner spinner-white spinner-right').attr('disabled', false);
        };
        /**
         * Opciones para generar el objeto del formulario
         */
        var options = {
            beforeSubmit:showRequest
            , success:  showResponse
            , data: {type:'{/literal}{$type}{literal}'}
        };
        /**
         * Se da las propiedades de ajaxform al formulario
         */
        var handle_form_submit=function(){
            form.ajaxForm(options);
            formv = FormValidation.formValidation(
                document.getElementById('form_{/literal}{$subcontrol}{literal}'),
                {
                    plugins: {
                        declarative: new FormValidation.plugins.Declarative({html5Input: true,}),
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap: new FormValidation.plugins.Bootstrap(),
                        submitButton: new FormValidation.plugins.SubmitButton(),
                    }
                }
            );
        };
        /**
         * Se da las funcionalidades al boton enviar
         */
        var handle_btn_submit = function() {
            btn_submit.click(function(e) {
                e.preventDefault();
                /**
                 * Copiamos los datos de summerNote a una variable
                 */
                $('#description_input').val($('#description').summernote('code'));
                formv.validate().then(function(status) {
                    if(status === 'Valid'){
                        form.submit();
                    }
                });
            });
        };
        /**
         * Iniciamos los componentes necesarios como , summernote, select2 entre otros
         */
        var handle_components = function(){
            coreUyuni.setComponents();
            $('.select2_general_unidad').select2({
                placeholder: lngUyuni.select2PlaceHolder
                ,width: '75%'
            });
            $('.select2_general_actividad').select2({
                placeholder: lngUyuni.select2PlaceHolder
                ,width: '90%'
            });
        };


        /**
         * añadir Actividad form
         * getPerson
         */
        var subcontrol = "{/literal}{$subcontrol}{literal}";
        var actividad_btn = $("#actividad_btn");
        var actividad_opt = $("#actividad_tipo_id");
        var handle_addActividad = function () {
            actividad_btn.click(function(e){
                e.preventDefault();
                var load_url = urlsys;
                load_url += '/get.formaddactividad';
                let cargando = lngUyuni.loading+'...'+cargando_vista;
                $("#modal-content_"+subcontrol+"_peque").html(cargando);
                $("#form_modal_"+subcontrol+"_peque").modal("show");
                $.get(load_url, function(data) {
                    $("#modal-content_"+subcontrol+"_peque").html(data);
                });
            });
        };

        var getActividad = function(id){
            actividad_opt.find("option").remove();
            $.post(urlsys+"/get.actividad", {}
                , function (res, textStatus, jqXHR) {
                    let selOption = $('<option></option>');
                    actividad_opt.append(selOption.attr("value", "").text("{/literal}{#field_holder_person_id#}{literal}"));
                    let person_list = []
                    for (var row in res) {
                        actividad_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                        person_list[res[row].id] = res[row];
                    }
                    actividad_opt.val(id);
                    actividad_opt.trigger('change');
                }
                , 'json');
            actividad_opt.prop('disabled', false);
        };
        /**
         * añadir Unidad form
         * getPerson
         */
        var subcontrol = "{/literal}{$subcontrol}{literal}";
        var unidad_btn = $("#unidad_btn");
        var unidad_opt = $("#actividad_unidad_id");
        var handle_addUnidad = function () {
            unidad_btn.click(function(e){
                e.preventDefault();
                var load_url = urlsys;
                load_url += '/get.formaddunidad';
                let cargando = lngUyuni.loading+'...'+cargando_vista;
                $("#modal-content_"+subcontrol+"_peque").html(cargando);
                $("#form_modal_"+subcontrol+"_peque").modal("show");
                $.get(load_url, function(data) {
                    $("#modal-content_"+subcontrol+"_peque").html(data);
                });
            });
        };

        var getUnidad= function(id){
            unidad_opt.find("option").remove();
            $.post(urlsys+"/get.unidad", {}
                , function (res, textStatus, jqXHR) {
                    let selOption = $('<option></option>');
                    unidad_opt.append(selOption.attr("value", "").text("{/literal}{#field_holder_person_id#}{literal}"));
                    let person_list = []
                    for (var row in res) {
                        unidad_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                        person_list[res[row].id] = res[row];
                    }
                    unidad_opt.val(id);
                    unidad_opt.trigger('change');
                }
                , 'json');
            unidad_opt.prop('disabled', false);
        };




        //== Public Functions
        return {
            // public functions
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
                handle_addActividad();
                handle_addUnidad()
            },
            getActividad:function (id) {
                getActividad(id);
            },
            getUnidad:function (id) {
                getUnidad(id);
            }

        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_form_{/literal}{$subcontrol}{literal}.init();
    });

</script>
{/literal}
