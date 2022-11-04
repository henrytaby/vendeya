{literal}
<script>
    var id;
    var snippet_general_form = function(){
        "use strict";
        /**
         * Datos del formulario y el boton
         */
        var form = $('#general_form');
        var btn_submit = $('#general_submit');

        var formv;
        /**
         * Antes de enviar el formulario se ejecuta la siguiente funcion
         */
        var showRequest= function(formData, jqForm, op)  {
            btn_submit.addClass('spinner spinner-white spinner-right').attr('disabled', true);
            return true;
        };

        var showResponse = function (res, statusText) {
            btn_submit.removeClass('spinner spinner-white spinner-right').attr('disabled', false);
            let url = "{/literal}{$path_url}{literal}";
            coreUyuni.generalShowResponse(res,url);

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
            document.getElementById('general_form'),
            {
                fields: {
                    "item[type]": {
                        validators: {
                            notEmpty: {
                                message: 'Seleccione una opción',
                            },
                        },
                    },
                    "item[distribuidor_id]": {
                        validators: {
                            callback: {
                                message: 'Seleccione la empresa distribuidora',
                                callback: function(input) {
                                    return (id !== '3')
                                        ? true
                                        : (input.value !== '');
                                }
                            }
                        }
                    },
                },
                plugins: {
                    declarative: new FormValidation.plugins.Declarative({html5Input: true,}),
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap: new FormValidation.plugins.Bootstrap(),
                    submitButton: new FormValidation.plugins.SubmitButton(),
                    excluded: new FormValidation.plugins.Excluded({
                        excluded: function (field, ele, eles) {
                            return (field == "item[distribuidor_id]" && id != '3') || (field == "item[type]" && id == '3');
                        },
                    }),
                },

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
                $('#descripcion_input').val($('#descripcion').summernote('code'));

                formv.validate().then(function(status) {
                    if(status === 'Valid'){
                        form.submit();
                    }else{
                        Swal.fire({icon: 'error',title: lngUyuni.formFieldControlTitle, text: lngUyuni.formFieldControlMsg});
                    }
                });

            });
        };
        /**
         * Iniciamos los componentes necesarios como , summernote, select2 entre otros
         */
        var handle_components = function(){
            coreUyuni.setComponents();
        };

        var handle_tipo_select = function(){
            $('#type').on('change',function(){
                handle_tipo();
            });
        };

        var distribuidor_div= $('#distribuidor_div');
        var handle_tipo = function(){
            id = $('#type').val();
            id = id==null? '': id.toString();
            distribuidor_div.addClass('d-none');
            switch (id){
                case '3':
                    distribuidor_div.removeClass('d-none');
                    break;
            }
        };

        return {
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
                handle_tipo_select();
            }
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_general_form.init();
    });

</script>
{/literal}