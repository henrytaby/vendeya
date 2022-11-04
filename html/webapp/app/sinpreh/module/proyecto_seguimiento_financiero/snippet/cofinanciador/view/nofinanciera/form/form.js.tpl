{literal}
<script>
    var snippet_form_{/literal}{$subcontrol}{literal} = function() {
        "use strict";
        var numTable = 1;
        let form = $('#form_{/literal}{$subcontrol}{literal}');
        let btn_submit = $('#form_submit_{/literal}{$subcontrol}{literal}');
        let btn_close = $('#form_close_{/literal}{$subcontrol}{literal}');
        let pmodal = $("#form_modal_{/literal}{$subcontrol}{literal}");
        let entidad;
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
            coreUyuni.itemFormShowResponse(res,pmodal,table_list_01);
            btn_close.attr('disabled', false);
            btn_submit.removeClass('spinner spinner-white spinner-right').attr('disabled', false);
        };
        /**
         * Opciones para generar el objeto del formulario
         */
        var options = {
            beforeSubmit:showRequest
            , success:  showResponse
            , data: {type:'{/literal}{$type}{literal}'
                ,numTable:numTable
            }
        };
        /**
         * Se da las propiedades de ajaxform al formulario
         */
        var handle_form_submit=function(){
            form.ajaxForm(options);
            formv = FormValidation.formValidation(
                document.getElementById('form_{/literal}{$subcontrol}{literal}'),
                {
                    fields: {
                        input_file: {
                            validators: {
                                file: {
                                    extension: 'pdf',
                                    type: 'application/pdf',
                                    message: 'Por favor seleccione un archivo PDF',
                                },
                            },
                        },
                    },
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
                        entidad = snippet_list.get_entidad();
                        $("#proyecto_financiador_id").val(entidad);
                        form.submit();
                    }
                });
            });

            $("#entidad_form").val($("#entidad option:selected").text());
        };
        /**
         * Iniciamos los componentes necesarios como , summernote, select2 entre otros
         */
        var handle_components = function(){
            coreUyuni.setComponents();
            $('#input_file').on('change', function() {
                let fileName = $(this).val().split('\\').pop();
                if(fileName!=""){
                    $("#input_file_name").addClass("input-attached-file").html(fileName);
                }
            });
        };

        //== Public Functions
        return {
            // public functions
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
            }
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_form_{/literal}{$subcontrol}{literal}.init();
    });

</script>
{/literal}
