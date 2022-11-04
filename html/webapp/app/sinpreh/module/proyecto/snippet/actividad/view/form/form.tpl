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

                <div class="col-lg-6">
                    <label>{#field_actividad_tipo_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general_actividad"
                                name="item[actividad_tipo_id]" id="actividad_tipo_id"
                                data-placeholder="{#field_holder_actividad_tipo_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.actividad_tipo selected=$item.actividad_tipo_id}
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-primary" id="actividad_btn" type="button">+</button>
                        </div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_actividad_tipo_id#}</span>
                </div>



                <div class="col-lg-3">
                    <label>{#field_total#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal input_money text-right pr-5 "
                               name="item[total]" id="total" value="{$item.total|escape:"html"}" required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        {*<div class="input-group-append"><span class="input-group-text field_money"><i class="fas fa-money-bill-alt"></i></span></div>*}
                    </div>
                    <span class="form-text text-black-50">{#field_msg_total#}</span>
                </div>



                <div class="col-lg-3">
                    <label>{#field_actividad_unidad_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general_unidad"
                                name="item[actividad_unidad_id]" id="actividad_unidad_id"
                                data-placeholder="{#field_holder_actividad_unidad_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.actividad_unidad selected=$item.actividad_unidad_id}
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-primary" id="unidad_btn" type="button">+</button>
                        </div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_actividad_unidad_id#}</span>
                </div>

{*
                <div class="col-lg-12">
                    <label>{#field_nombre#}  :</label>
                    <input type="text" class="form-control"
                           name="item[nombre]" id="nombre"
                           value="{$item.nombre|escape:"html"}"
                           placeholder=""
                           data-fv-not-empty___message="{#glFieldRequired#}"
                           minlength="3"
                           required
                           data-fv-string-length___message="{#field_length_nombre#}"
                    >
                    <span class="form-text text-black-50">{#field_msg_nombre#}</span>
                </div>

*}
                <div class="col-lg-12">
                    <label>{#field_detalle#}  :</label>
                    <input type="text" class="form-control"
                           name="item[detalle]"
                           value="{$item.detalle|escape:"html"}"
                           placeholder=""
                           data-fv-not-empty___message="{#glFieldRequired#}"
                           minlength="3"
                           data-fv-string-length___message="{#field_length_detalle#}"
                    >
                    <span class="form-text text-black-50">{#field_msg_detalle#}</span>
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
