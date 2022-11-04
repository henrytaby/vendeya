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




        <div class="card-body  pt-1 pb-0 programa" >
            <div class="form-group row  pt-0 pb-0 mb-0">
                <div class="col-lg-2">
                    <label>{#field_tipo_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[tipo_id]" id="type_select_tipo"
                                data-placeholder="{#field_holder_tipo_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            {*<option value="0">Ninguno</option>*}
                            <option></option>
                            {html_options options=$cataobj.tipo selected=$item.tipo_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_norma_id#}</span>
                </div>
                <div class="col-lg-3">
                    <label>{#field_convenio_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[convenio_id]" id="convenio_id"
                                data-placeholder="{#field_holder_convenio_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.convenio selected=$item.convenio_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_convenio_id#}</span>
                </div>
                <div class="col-lg-7">
                    <label>{#field_name#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[nombre]" value="{$item.nombre|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_name#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas flaticon-layer"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_name#}</span>
                </div>
            </div>
        </div>
        <div class="card-body pt-1 pb-0 ">
            <div class="form-group row">
                <div class="col-lg-3">
                    <label>{#field_estado_id#} : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[estado_id]" id="type_select_estado"
                                data-placeholder="{#field_Holder_estado_id#}" {$privFace.input}

                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.estado selected=$item.estado_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_estado_id#}</span>
                </div>
                <div class="col-lg-9">
                    <label>{#field_estado_idd#}: </label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[estado_detallado]" value="{$item.estado_detallado|escape:"html"}"

                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_estado_idd#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-align-justify"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_estado_idd#}</span>
                </div>


                <div class="col-lg-12">
                    <label>{#field_programa_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[programa_id]" id="programa_id"
                                data-placeholder="{#field_holder_programa_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.programa selected=$item.programa_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_programa_id#}</span>
                </div>
                {*
                <div class="col-lg-6">
                    <label>{#field_programa_convenio_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[programa_convenio_id]" id="programa_convenio_id"
                                data-placeholder="{#field_holder_programa_convenio_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.programa_convenio selected=$item.programa_convenio_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_programa_convenio_id#}</span>
                </div>
*}
            </div>
        </div>

        <div class="card-body pt-1 pb-0 ">
            <div class="form-group row">

                <div class="col-lg-12">
                    <label>{#field_objetivo_g#} </label>
                    <div class="m-input-icon m-input-icon--right">
                        <div class="summernote" id="objetivo_general">{$item.objetivo_general}</div>
                        <input class="form-control m-input" type="hidden" name="item[objetivo_general]" id="general_input" {$privFace.input}>
                    </div>
                </div>

                <div class="col-lg-12">
                    <label>{#field_objetivo_e#} </label>
                    <div class="m-input-icon m-input-icon--right">
                        <div class="summernote" id="objetivo_especifico">{$item.objetivo_especifico}</div>
                        <input class="form-control m-input" type="hidden" name="item[objetivo_especifico]" id="especifico_input" {$privFace.input}>
                    </div>
                </div>

                <div class="col-lg-12">
                    <label>{#field_metas#} </label>
                    <div class="m-input-icon m-input-icon--right">
                        <div class="summernote" id="metas">{$item.metas}</div>
                        <input class="form-control m-input" type="hidden" name="item[metas]" id="metas_input" {$privFace.input}>
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