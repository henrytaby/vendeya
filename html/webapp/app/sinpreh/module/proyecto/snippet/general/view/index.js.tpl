{literal}
<script>
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


        var handle_calcula_fecha = function(){
            $(".calculaFecha").on('blur',function(){
                calcula();
            });
            $(".calculaFecha").on('change',function(){
                calcula();
            });
        };

        var calcula = function (){
            let ampliacion = $("#fecha_fin_ampliacion").val();
            if(ampliacion==""){
                $("#fecha_conclusion").val($("#fecha_fin_inicial").val());
            }
        };


        var handle_calculos = function(){
            $(".beneficiarios").on('blur',function(){
                calcula_beneficiarios();
            });
            $(".beneficiarios").on('keyup',function(){
                calcula_beneficiarios();
            });

            $(".empleos").on('blur',function(){
                calcula_empleos();
            });
            $(".empleos").on('keyup',function(){
                calcula_empleos();
            });

        };

        var calcula_beneficiarios = function (){
            let directo = $("#familias_beneficiarias_directa").val();
            directo = (directo=="")?0:parseInt(directo);
            let indirecto = $("#familias_beneficiarias_indirecta").val();
            indirecto = (indirecto=="")?0:parseInt(indirecto);
            //console.log("Valores Directo:"+directo+" / Indirecto :"+indirecto);
            $("#familia_beneficiarias_total").val(directo+indirecto);
        };

        var calcula_empleos = function (){
            let directo = $("#generacion_empleo_directa").val();
            directo = (directo=="")?0:parseInt(directo);
            let indirecto = $("#generacion_empleo_indirecta").val();
            indirecto = (indirecto=="")?0:parseInt(indirecto);
            $("#generacion_empleo_total").val(directo+indirecto);
        };

        return {
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
                handle_calcula_fecha();
                handle_calculos();
            }
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_general_form.init();
    });

</script>
{/literal}