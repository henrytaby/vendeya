{literal}
<script>
    var snippet_general_form = function(){
        "use strict";
        /**
         * Datos del formulario y el boton
         */
        var form = $('#general_form');
        var btn_submit = $('#general_submit');
        var urlsys = '{/literal}{$path_url}/{$subcontrol}_/{$id}{literal}';
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
            if(res.res ==1 && res.accion =='update'){
                $('#general_tab').trigger('click');
            }
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
            $('#input_file').on('change', function() {
                let fileName = $(this).val().split('\\').pop();
                if(fileName!=""){
                    $("#input_file_name").addClass("input-attached-file").html(fileName);
                }
            });
        };

        var handle_calcula_fecha = function(){
            $(".calculaFecha").on('blur',function(){
                calcula();
            });
            $(".calculaFecha").on('change',function(){
                calcula();
            });
        };


        /**
         * Calcula año, meses y dias entre 2 fechas
         */

        var calcula = function (){

            let enmienda = $("#fecha_conclusion_enmienda").val();
            //console.log("enmienda "+enmienda);
            if(enmienda==""){
                $("#convenio_vigencia_fecha").val($("#fecha_conclusion").val());
            }

            /**
             * Calcula año mes dias pasado entre 2 fechas
             * convenio_vigencia_fecha
             */
            let fecha_inicio = $("#fecha_inicio").val();

            //let fecha_fin = $("#fecha_conclusion").val();
            let fecha_fin = $("#convenio_vigencia_fecha").val();

            let fi = fecha_inicio.split("/");
            let ff = fecha_fin.split("/");
            fecha_inicio = fi[2]+"-"+fi[1]+"-"+fi[0];
            fecha_fin = ff[2]+"-"+ff[1]+"-"+ff[0];
            diffTime(fecha_inicio,fecha_fin);

        };
        var diffTime = function (startingDate, endingDate) {
            var startDate = new Date(new Date(startingDate).toISOString().substr(0, 10));
            if (!endingDate) {
                endingDate = new Date().toISOString().substr(0, 10);    // need date in YYYY-MM-DD format
            }
            var endDate = new Date(endingDate);
            if (startDate > endDate) {
                var swap = startDate;
                startDate = endDate;
                endDate = swap;
            }
            var startYear = startDate.getFullYear();
            var february = (startYear % 4 === 0 && startYear % 100 !== 0) || startYear % 400 === 0 ? 29 : 28;
            var daysInMonth = [31, february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

            var yearDiff = endDate.getFullYear() - startYear;
            var monthDiff = endDate.getMonth() - startDate.getMonth();
            if (monthDiff < 0) {
                yearDiff--;
                monthDiff += 12;
            }
            var dayDiff = endDate.getDate() - startDate.getDate();
            if (dayDiff < 0) {
                if (monthDiff > 0) {
                    monthDiff--;
                } else {
                    yearDiff--;
                    monthDiff = 11;
                }
                dayDiff += daysInMonth[startDate.getMonth()];
            }
            $("#vigencia_anios").val(yearDiff);
            $("#vigencia_mes").val(monthDiff);
            $("#vigencia_dias").val(dayDiff);

            $("#vigencia_anios2").val(yearDiff);
            $("#vigencia_mes2").val(monthDiff);
            $("#vigencia_dias2").val(dayDiff);
            //console.log(yearDiff + 'Y ' + monthDiff + 'M ' + dayDiff + 'D');
            //return yearDiff + 'Y ' + monthDiff + 'M ' + dayDiff + 'D';
        }

        /**
         * Download File
         */
        function download(id){
            var url = urlsys+"/download";
            window.open(url, '_blank');
        }
        /**
         * Delete
         */
        var  item_delete = function(id){
            var url = urlsys+"/delete";

            Swal.fire({
                title: '¿Estás seguro de eliminar el archivo de respaldo?',
                html: "Se eliminará permanentemente el archivo",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "<i class='la la-trash'></i> "+lngUyuni.deleteBtnYes,
                cancelButtonText: "<i class='la la-thumbs-down'></i> "+lngUyuni.deleteBtnNo,
                customClass: {
                    confirmButton: "btn btn-danger",
                    cancelButton: "btn btn-default"
                }
            }).then(function(result) {
                if (result.value) {
                    itemDeleteAction(url);
                }
            });
        };

        var itemDeleteAction = function(url){
            Swal.fire({
                title: lngUyuni.deleteActionTitle,
                html: lngUyuni.deleteActionMsg+cargando_vista,
                showConfirmButton: false,
                allowEnterKey: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });

            $.get( url, {},
                function(res){
                    if(res.res == 1){
                        Swal.close();
                        Swal.fire({icon: 'success',title: lngUyuni.deleteActionSucess,showConfirmButton: false,timer: 1000});
                        $('#general_tab').trigger('click');
                    }else{
                        var errorname = "lngUyuni.deleteError"+res.type;
                        var msg_error =eval(errorname);
                        if (res.msgdb !== undefined){
                            msg_error += '<div class="alert alert-danger font-size-xs" role="alert">';
                            msg_error += '<strong>'+lngUyuni.technicalData+': </strong>'+res.msgdb+'</div>';
                        }
                        Swal.fire({
                            icon: "error", title: lngUyuni.deleteErrorTitle,
                            html:msg_error, showClass: {popup: 'animate__animated animate__wobble'}
                        });

                    }
                },"json");
        };


        return {
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
                handle_calcula_fecha();
            },
            delete: function(id){
                item_delete();
            },
            download: function (id) {
                download(id);
            },
        };
    }();
    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_general_form.init();

    });

</script>
{/literal}