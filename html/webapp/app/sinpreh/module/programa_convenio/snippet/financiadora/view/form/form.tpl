{include file="form/form.css.tpl"}
<form method="POST"
      action="{$path_url}/{$subcontrol}_/{$item_id}/{if $type=="update"}{$id}/{/if}save/"
      id="form_{$subcontrol}">
    {if $item.id != "" or $type == 'new'}
        <div class="modal-body">
            <div class="alert alert-primary" role="alert">
                {if $type == 'new'}{#glnew#}{else}{#glupdate#}{/if} - {#title#}
            </div>



            <div class="form-group row">
                {* --------------------- Selección --------------------- *}
                <div class="col-lg-6">
                    <label>{#field_financiador_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[programa_convenio_financiador_id]" id="programa_convenio_financiador_id"
                                data-placeholder="{#field_holder_financiador_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.programa_convenio_financiador selected=$item.programa_convenio_financiador_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_financiador_id#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_tipo_financiamiento_id#} <span class="text-danger bold">*</span>: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[programa_convenio_tipo_financiamiento_id]" id="programa_convenio_tipo_financiamiento_id"
                                data-placeholder="{#field_holder_tipo_financiamiento_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.programa_convenio_tipo_financiamiento selected=$item.programa_convenio_tipo_financiamiento_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_tipo_financiamiento_id#}</span>
                </div>
                {* ------------------------------------------ *}
                {* --------------------- MONTO --------------------- *}
                <div class="col-lg-3">
                    <label>{#field_moneda_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[moneda_id]" id="moneda_id"
                                data-placeholder="{#field_holder_moneda_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.moneda selected=$item.moneda_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_moneda_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_monto#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal input_money text-right pr-5 "
                               name="item[monto]" value="{$item.monto|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_money"><i class="fas fa-money-bill-alt"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_monto#}</span>
                </div>
                <div class="col-lg-5">
                    <label>{#field_monto_bs#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal input_money text-right pr-5"
                               name="item[monto_bs]" value="{$item.monto_bs|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_money"><i class="fas fa-money-bill-alt"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_monto_bs#}</span>
                </div>
                {* ------------------------------------------ *}
                <div class="col-lg-12">
                    <label>{#field_descripcion#} :</label>
                    <input type="text" class="form-control"
                           name="item[descripcion]"
                           value="{$item.descripcion|escape:"html"}"
                           placeholder=""
                           data-fv-not-empty___message="{#glFieldRequired#}"
                           minlength="3"
                           data-fv-string-length___message="{#field_length_descripcion#}"
                    >
                    <span class="form-text text-black-50">{#field_msg_descripcion#}</span>
                </div>

            </div>

        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-light-primary" id="form_close_{$subcontrol}" data-dismiss="modal"><i class="la la-angle-double-left"></i>{#glBtnCloce#}</button>
            <button type="button" class="btn btn-primary font-weight-bold" id="form_submit_{$subcontrol}"><i class="la la-save"></i>{#glBtnSave#}</button>
        </div>

    {else}
        <div class="modal-body">
            No existe el registro
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-light-primary" id="form_close_{$subcontrol}" data-dismiss="modal"><i class="la la-angle-double-left"></i>Cerrar</button>
        </div>
    {/if}

</form>

{include file="form/form.js.tpl"}
