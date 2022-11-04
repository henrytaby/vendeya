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
            <h3 class="card-label text-primary">{#title#}</h3>
        </div>
    </div>
    <!--begin::Form-->
    <form method="POST"
          action="{$path_url}/{$subcontrol}_/{if $type=="update"}{$id}/{/if}save/"
          id="general_form">

        <div class="card-body  pt-0 pb-0" >
            <div class="form-group row  pt-0 pb-0 mb-0">

                <div class="col-lg-4">
                    <label>{#field_tipo_id#} : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[tipo_id]" id="select_tipo_id"
                                data-placeholder="{#field_holder_tipo_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.tipo selected=$item.tipo_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_tipo_id#}</span>
                </div>
                <div class="col-lg-8"></div>

                <div class="col-lg-2">
                    <label>{#field_numero_convenio#} <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[numero_convenio]" value="{$item.numero_convenio|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-grip-vertical"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_numero_convenio#}</span>
                </div>

                <div class="col-lg-2">
                    <label>{#field_gestion#} <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2 "
                               name="item[gestion]" value="{$item.gestion|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_key"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_gestion#}</span>
                </div>

                <div class="col-lg-8">
                    <label>{#field_nombre#}  : </label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[nombre]" value="{$item.nombre|escape:"html"}"

                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_nombre#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_nombre#}</span>
                </div>

                {* ------------------- Plazo ------------------- *}
                <div class="col-lg-4">
                    <label>{#field_vigencia_anios#}:</label>
                    <div class="input-group">
                        <input type="number" class="form-control number_integer p-5" id="vigencia_anios2"
                               name="item[vigencia_anios2]" value="{$item.vigencia_anios|escape:"html"}" disabled
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        ><input type="hidden" name="item[vigencia_anios]" id="vigencia_anios" value="{$item.vigencia_anios|escape:"html"}">
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-calendar-check"></i></span></div>
                    </div>
                    <span class="form-text text-primary">{#field_msg_vigencia_anios#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_vigencia_mes#}:</label>
                    <div class="input-group">
                        <input type="number" class="form-control number_integer p-5" id="vigencia_mes2"
                               name="item[vigencia_mes2]" value="{$item.vigencia_mes|escape:"html"}" disabled
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        ><input type="hidden" name="item[vigencia_mes]" id="vigencia_mes" value="{$item.vigencia_mes|escape:"html"}">
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-calendar-check"></i></span></div>
                    </div>
                    <span class="form-text text-primary">{#field_msg_vigencia_mes#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_vigencia_dias#}:</label>
                    <div class="input-group">
                        <input type="number" class="form-control number_integer p-5"  id="vigencia_dias2"
                               name="item[vigencia_dias2]" value="{$item.vigencia_dias|escape:"html"}" disabled
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        ><input type="hidden" name="item[vigencia_dias]" id="vigencia_dias" value="{$item.vigencia_dias|escape:"html"}">
                        <div class="input-group-append"><span class="input-group-text"><i class="fas fa-calendar-check"></i></span></div>
                    </div>
                    <span class="form-text text-primary">{#field_msg_vigencia_dias#}</span>
                </div>
                {* ------------------------------------------ *}

                <div class="col-lg-6">
                    <label>{#field_fecha_firma#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="fecha_firma"
                               name="item[fecha_firma]" value="{$item.fecha_firma|date_format:'%d/%m/%Y'}" required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_firma#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_fecha_inicio#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general calculaFecha" id="fecha_inicio"
                               name="item[fecha_inicio]" value="{$item.fecha_inicio|date_format:'%d/%m/%Y'}" required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_inicio#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_fecha_conclusion#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general calculaFecha" id="fecha_conclusion"
                               name="item[fecha_conclusion]" value="{$item.fecha_conclusion|date_format:'%d/%m/%Y'}" required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_conclusion#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_fecha_conclusion_enmienda#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="fecha_conclusion_enmienda"
                               name="item[fecha_conclusion_enmienda]" value="{$item.fecha_conclusion_enmienda|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol "></i></span></div>
                    </div>
                    {*<span class="form-text text-black-50">{#field_msg_fecha_conclusion_enmienda#}</span>*}
                </div>


                <div class="col-lg-6">
                    <label>{#field_convenio_vigencia_tipo_id#} : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[convenio_vigencia_tipo_id]" id="convenio_vigencia_tipo_id"
                                data-placeholder="{#field_holder_convenio_vigencia_tipo_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.convenio_vigencia_tipo selected=$item.convenio_vigencia_tipo_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_convenio_vigencia_tipo_id#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_convenio_vigencia_fecha#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="convenio_vigencia_fecha"
                               name="item[convenio_vigencia_fecha]" value="{$item.convenio_vigencia_fecha|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_convenio_vigencia_fecha#}</span>
                </div>


                <div class="col-lg-12">
                    <label>{#field_descripcion#}:</label>
                    <div class="input-group">
                        <textarea rows="6" class="form-control m-input"
                                  name="item[descripcion]"
                        >{$item.descripcion|escape:'html'}</textarea>
                    </div>
                    <span class="form-text text-muted">{#field_msg_descripcion#}</span>
                </div>

            </div>
        </div>


        <div class="card-body  pt-0 pb-0" >

            <div class="form-group row pt-0 pb-0 mb-0">
                <div class="col-lg-6">
                    <label>{#field_file#} </label>
                    <div class="custom-file">
                        <input type="file" class="form-control custom-file-input"
                               placeholder="{#field_holder_file#}"
                               name="input_file" id="input_file"
                                accept="application/pdf"
                                {if $type == 'new'}required{/if}
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <label class="custom-file-label file-name" id="input_file_name" for="input_file"></label>
                    </div>

                    <span class="form-text text-black-50">{#field_msg_file#}</span>


                    </span>
                </div>
                <div class="col-lg-6">

                    {if $item.attached_name != ""}
                        {if $type == 'update'}
                            <a href="javascript:snippet_general_form.download();" class="btn btn-icon btn-circle btn-s btn-light-success" title="Descargar archivo"><i class="fas fa-cloud-download-alt"></i></a>
                            <strong>Archivo:</strong> <a href="javascript:snippet_general_form.download();" class="" title="Descargar archivo">
                            <span class="m--font-success">{$item.attached_name}</span></a>
                            &nbsp;&nbsp;
                            <br>
                            <a href="javascript:snippet_general_form.delete();" class="mt-3 btn btn-icon btn-circle btn-s btn-light-danger" title="Borrar archivo"><i class="fas fa-trash-alt"></i></a>
                        {/if}
                    {/if}
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