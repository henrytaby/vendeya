{include file="index.css.tpl"}
<div class="card card-custom gutter-b example example-compact">
    <div class="card-body pt-0 pb-0 pl-5 pr-5">
        <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
            <div class="alert-icon"><i class="flaticon-notes"></i></div>
            <div class="alert-text text-justify text-dark-65" >{#message#}</div>
        </div>
    </div>

    <div class="card-header py-3">
        <div class="card-title">
            <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
            <h3 class="card-label text-dark-50">{#title#}</h3>
        </div>
    </div>
    <!--begin::Form-->
    <form method="POST"
          action="{$path_url}/{$subcontrol}_/{if $type=="update"}{$id}/{/if}save/"
          id="general_form">

        <div class="card-body  pt-1 pb-0">
            <div class="form-group row pt-0 pb-0 mb-0">
                {* --------------------- Programa Estado --------------------- *}
                <div class="col-lg-8">
                    <label>{#field_programa_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[programa_id]" id="type_select_programa"
                                data-placeholder="{#field_Holder_programa_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.programa selected=$item.programa_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_programa_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_estado_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[estado_id]" id="type_select_estado"
                                data-placeholder="{#field_Holder_estado_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.programa_convenio_estado selected=$item.estado_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_estado_id#}</span>
                </div>
                {* ------------------------------------------ *}
                <div class="col-lg-4">
                    <label>{#field_codigo#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[codigo]" value="{$item.codigo|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_key"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_codigo#}</span>
                </div>
                <div class="col-lg-8">
                    <label>{#field_name#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[nombre]" value="{$item.nombre|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_name#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_name#}</span>
                </div>
                {* --------------------- fechas --------------------- *}
                <div class="col-lg-4">
                    <label>{#field_datef#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[fecha_firma]" value="{$item.fecha_firma|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_datef#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_datefi#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[fecha_finalizacion]" value="{$item.fecha_finalizacion|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_datefi#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_dateu#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[fecha_max_ultimo_desembolso]" value="{$item.fecha_max_ultimo_desembolso|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_dateu#}</span>
                </div>
                {*
                <div class="col-lg-6">
                    <label>{#field_datea#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[fecha_aprobacion]" value="{$item.fecha_aprobacion|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_datea#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_fecha_conclusion_enmienda#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[fecha_conclusion_enmienda]" value="{$item.fecha_conclusion_enmienda|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol "></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_conclusion_enmienda#}</span>
                </div>

*}









                {* --------------------- fechas --------------------- *}

                {*
                <div class="col-lg-4">
                    <label>{#field_moneda_id#}:</label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[moneda_id]" id="type_select_moneda"
                                data-placeholder="{#field_Holder_norma_id#}" {$privFace.input}

                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option value="0">Ninguno</option>
                            {html_options options=$cataobj.programa_convenio_moneda selected=$item.moneda_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_norma_id#}</span>
                </div>


                <div class="col-lg-4">
                    <label>{#field_convenio_ejecutor#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[convenio_ejecutor][]" id="convenio_ejecutor"
                                multiple="multiple"
                                data-placeholder="{#field_holder_convenio_ejecutor#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.ejecutor selected=$item.convenio_ejecutor}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_convenio_ejecutor#}</span>
                </div>
*}

                {*
                <div class="col-lg-4">
                    <label>{#field_financiador_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[financiador_id]" id="type_select_finan"
                                data-placeholder="{#field_Holder_financiador_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option value="0">Ninguno</option>
                            {html_options options=$cataobj.programa_convenio_financiador selected=$item.financiador_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_financiador_id#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_tipo_financiamiento_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[tipo_financiamiento_id]" id="type_select_tipo"
                                data-placeholder="{#field_Holder_tipo_financiamiento_id#}" {$privFace.input}

                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option value="0">Ninguno</option>
                            {html_options options=$cataobj.programa_convenio_tipo_financiamiento selected=$item.tipo_financiamiento_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_tipo_financiamiento_id#}</span>
                </div>
                *}


                {*
                <div class="col-lg-4">
                    <label>{#field_tipo_implementador_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[implementador_id]" id="type_select_imple"
                                data-placeholder="{#field_Holder_tipo_implementador_id#}" {$privFace.input}
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option value="0">Ninguno</option>
                            {html_options options=$cataobj.programa_convenio_implementador selected=$item.implementador_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_tipo_implementador_id#}</span>
                </div>
*}

                <div class="col-lg-12">
                    <label>{#field_descripcion#} </label>
                    <div class="m-input-icon m-input-icon--right">
                        <div class="summernote" id="descripcion">{$item.descripcion}</div>
                        <input class="form-control m-input" type="hidden" name="item[descripcion]" id="descripcion_input" {$privFace.input}>
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