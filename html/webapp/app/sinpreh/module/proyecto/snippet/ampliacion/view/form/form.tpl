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
                    <label>{#field_fecha_conclusion#} <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="fecha_conclusion" id="fecha_conclusion" value="{$fecha_inicio|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <input type="hidden" name="item[fecha_inicio]" value="{$fecha_inicio|date_format:'%d/%m/%Y'}">
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_conclusion#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_ampliacion_tipo_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[ampliacion_tipo_id]" id="ampliacion_tipo_id"
                                data-placeholder="{#field_holder_ampliacion_tipo_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.ampliacion_tipo selected=$item.ampliacion_tipo_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_actividad_tipo_id#}</span>
                </div>



                <div class="col-lg-6">
                    <label>{#field_dias#} <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer calculaFecha"
                               name="item[dias]" id="dias" value="{$item.dias|escape:"html"}" required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        {*<div class="input-group-append"><span class="input-group-text field_money"><i class="fas fa-money-bill-alt"></i></span></div>*}
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="fab fa-buromobelexperte"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_dias#}</span>
                </div>


                <div class="col-lg-6">
                    <label>{#field_fecha_conclusion#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="fecha_fin2"
                               name="item[fecha_fin2]" value="{$item.fecha_fin|date_format:'%d/%m/%Y'}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <input type="hidden" name="item[fecha_fin]" value="{$item.fecha_fin|date_format:'%d/%m/%Y'}" id="fecha_fin">
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha_conclusion#}</span>
                </div>


                <div class="col-lg-12">
                    <label>{#field_descripcion#}  <span class="text-danger bold">*</span>:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[descripcion]" id="descripcion"
                               value="{$item.descripcion|escape:"html"}"
                               placeholder=""
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               required
                               data-fv-string-length___message="{#field_length_descripcion#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="fas fa-list"></i></span></div>
                    </div>
                <span class="form-text text-black-50">{#field_msg_descripcion#}</span>
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
