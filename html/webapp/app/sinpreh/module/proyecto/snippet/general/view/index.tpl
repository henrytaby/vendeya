{include file="index.css.tpl"}
<div class="card card-custom gutter-b example example-compact">
    <div class="card-body pt-0 pb-0 pl-5 pr-5">
        <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
            <div class="alert-icon"><i class="flaticon-notes"></i></div>
            <div class="alert-text text-justify text-dark-65" >{#message#}</div>
        </div>
    </div>


    <!--begin::Form-->
    <form method="POST"
          action="{$path_url}/{$subcontrol}_/{if $type=="update"}{$id}/{/if}save/"
          id="general_form">

        <div class="card-header py-3">
            <div class="card-title  m-0">
                <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
                <span class="font-weight-bold font-size-h4 text-primary">{#title#}</span>
            </div>
        </div>

        <div class="card-body  pt-1 pb-0">
            <div class="form-group row pt-0 pb-0 mb-0">
                <div class="col-lg-4">
                    <label>{#field_cod_are#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[cod_are]" value="{$item.cod_are|escape:"html"}"

                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_key"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_cod_are#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_cod_proy#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[cod_proy]" value="{$item.cod_proy|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_key"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_cod_proy#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_cod_conv#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[cod_conv]" value="{$item.cod_conv|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_key"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_cod_conv#}</span>
                </div>


                <div class="col-lg-6">
                    <label>{#field_tipo_proyecto_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[tipo_proyecto_id]" id="type_select_tipo"
                                data-placeholder="{#field_Holder_tipo_proyecto_id#}" {$privFace.input}
                                data-fv-not-empty___message="{#glFieldRequired#}" required
                        >
                            <option></option>
                            {html_options options=$cataobj.tipo_proyecto selected=$item.tipo_proyecto_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_tipo_proyecto_id#}</span>
                </div>
                <div class="col-lg-3">
                    <label>{#field_gestion#}: </label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2 "
                               name="item[gestion]" value="{$item.gestion|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength=4"
                               data-fv-string-length___message="{#field_length_gestion#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_gestion#}</span>
                </div>
                <div class="col-lg-3">
                    <label>{#field_emblematico#}:</label>
                    <div class="input-group">
                    <span class="switch switch-outline switch-icon switch-info">
                        <label><input type="checkbox" {if $item.emblematico == 1}checked="checked"{/if}
                              name="item[emblematico]" value="1" id="checkbox_emblematico" {$privFace.input}><span></span></label>
                    </span>
                    </div>
                    <span class="form-text text-muted">{#field_msg_emblematico#}</span>
                </div>

            </div>
        </div>

        <div class="card-body pt-1 pb-0 sisin">
            <div class="form-group row">
                {*------------------- SISIN -------------------*}
                <div class="col-lg-4">
                    <label>{#field_sisin#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[sisin]" value="{$item.sisin|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}" required
                        >
                        <div class="input-group-append"><span class="input-group-text field_key"><i class="fas fa-th"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_sisin#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_date_sisin#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="sisin_fecha"
                               name="item[sisin_fecha]" value="{$item.sisin_fecha|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_date_sisin#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_date_sisin_fin#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="sisin_fecha_fin"
                               name="item[sisin_fecha_fin]" value="{$item.sisin_fecha_fin|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_date_sisin_fin#}</span>
                </div>
                {*------------------- FIN SISIN -------------------*}
            </div>
        </div>
        <div class="card-body pt-1 pb-0">
            <div class="form-group row">
                <div class="col-lg-2">
                    <label>{#field_macro_id#} <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[macroregion_id]" id="type_select_macro"
                                data-placeholder="{#field_Holder_macro_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.macroregion selected=$item.macroregion_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_macro_id#}</span>
                </div>
                <div class="col-lg-5">
                    <label>{#field_proyecto_ejecutor#}  : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[proyecto_ejecutor][]" id="proyecto_ejecutor"
                                multiple="multiple"
                                data-placeholder="{#field_holder_proyecto_ejecutor#}" {$privFace.input}

                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.ejecutor selected=$item.proyecto_ejecutor}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_proyecto_ejecutor#}</span>
                </div>
                <div class="col-lg-5">
                    <label>{#field_proyecto_puebloindigena#}  : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[proyecto_puebloindigena][]" id="proyecto_puebloindigena"
                                multiple="multiple"
                                data-placeholder="{#field_holder_proyecto_puebloindigena#}" {$privFace.input}

                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.puebloindigena selected=$item.proyecto_puebloindigena}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_proyecto_puebloindigena#}</span>
                </div>


                <div class="col-lg-6">
                    <label>{#field_fecha_inicio#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="fecha_inicio"
                               name="item[fecha_inicio]" value="{$item.fecha_inicio|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_inicio#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_fecha_fin_inicial#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general calculaFecha" id="fecha_fin_inicial"
                               name="item[fecha_fin_inicial]" value="{$item.fecha_fin_inicial|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_fin_inicial#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_fecha_fin_ampliacion#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="fecha_fin_ampliacion"
                               name="item[fecha_fin_ampliacion]" value="{$item.fecha_fin_ampliacion|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_fin_ampliacion#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_fecha_conclusion#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general pr-5" id="fecha_conclusion"
                               name="item[fecha_conclusion]" value="{$item.fecha_conclusion|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_conclusion#}</span>
                </div>

            </div>
        </div>


        <div class="card-header py-3">
            <div class="card-title  m-0">
                <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
                <span class="font-weight-bold font-size-h4 text-primary">{#title_beneficiarios#}</span>
            </div>
        </div>


        <div class="card-body  pt-1 pb-0">
            <div class="form-group row pt-0 pb-0 mb-0">
                <div class="col-lg-4">
                    <label>{#field_familias_beneficiarias_directa#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer beneficiarios pr-5" id="familias_beneficiarias_directa"
                               name="item[familias_beneficiarias_directa]" value="{$item.familias_beneficiarias_directa|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        ><i class=""></i>
                        <div class="input-group-append"><span class="input-group-text field_bene"><i class="fas fa-users"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_familias_beneficiarias_directa#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_familia_beneficiarias_directa_mujeres#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer pr-5"
                               name="item[familia_beneficiarias_directa_mujeres]" value="{$item.familia_beneficiarias_directa_mujeres|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_mujer"><i class="fas fa-female"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_familia_beneficiarias_directa_mujeres#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_familia_beneficiarias_directa_hombres#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer pr-5"
                               name="item[familia_beneficiarias_directa_hombres]" value="{$item.familia_beneficiarias_directa_hombres|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_hombre"><i class="fas fa-male"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_familia_beneficiarias_directa_hombres#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_familias_beneficiarias_indirecta#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer beneficiarios pr-5" id="familias_beneficiarias_indirecta"
                               name="item[familias_beneficiarias_indirecta]" value="{$item.familias_beneficiarias_indirecta|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        ><i class=""></i>
                        <div class="input-group-append"><span class="input-group-text field_bene"><i class="fas fa-users"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_familias_beneficiarias_indirecta#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_familia_beneficiarias_indirecta_mujeres#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer pr-5"
                               name="item[familia_beneficiarias_indirecta_mujeres]" value="{$item.familia_beneficiarias_indirecta_mujeres|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_mujer"><i class="fas fa-female"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_familia_beneficiarias_indirecta_mujeres#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_familia_beneficiarias_indirecta_hombres#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer pr-5"
                               name="item[familia_beneficiarias_indirecta_hombres]" value="{$item.familia_beneficiarias_indirecta_hombres|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_hombre"><i class="fas fa-male"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_familia_beneficiarias_indirecta_hombres#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_familia_beneficiarias_total#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer pr-5" id="familia_beneficiarias_total"
                               name="item[familia_beneficiarias_total]" value="{$item.familia_beneficiarias_total|escape:"html"}" disabled
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        ><i class=""></i>
                        <div class="input-group-append"><span class="input-group-text field_bene"><i class="fas fa-users"></i></span></div>
                    </div>
                </div>

            </div>
        </div>

        <div class="card-header py-3">
            <div class="card-title  m-0">
                <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
                <span class="font-weight-bold font-size-h4 text-primary">{#title_empleos#}</span>
            </div>
        </div>

        <div class="card-body  pt-1 pb-0">
            <div class="form-group row pt-0 pb-0 mb-0">
                <div class="col-lg-4">
                    <label>{#field_generacion_empleo_directa#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer empleos pr-5" id="generacion_empleo_directa"
                               name="item[generacion_empleo_directa]" value="{$item.generacion_empleo_directa|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_empleo"><i class="fas fa-people-carry"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_generacion_empleo_directa#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_generacion_empleo_indirecta#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer empleos pr-5" id="generacion_empleo_indirecta"
                               name="item[generacion_empleo_indirecta]" value="{$item.generacion_empleo_indirecta|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_empleo"><i class="fas fa-people-carry"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_generacion_empleo_indirecta#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_generacion_empleo_total#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer" id="generacion_empleo_total"
                               name="item[generacion_empleo_total]" value="{$item.generacion_empleo_total|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <div class="input-group-append"><span class="input-group-text field_empleo"><i class="fas fa-people-carry"></i></span></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-footer">
            {if $privFace.edit == 1}
                <button type="reset" class="btn btn-primary mr-2" id="general_submit">
                    <i class="la la-save"></i>
                    {#glBtnSaveChanges#}</button>
            {/if}
            <a href="{$path_url}" class="btn btn-light-primary ">
                <i class="la la-angle-double-left"></i>{if $type =="new"} {#glBtnCancel#} {else} {#glBtnBackToList#}{/if}
            </a>
        </div>





    </form>
    <!--end::Form-->
</div>

{include file="index.js.tpl"}