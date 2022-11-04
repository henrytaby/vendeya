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
                {*
                <div class="col-lg-8">
                    <label>{#field_proyecto_actividad_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[proyecto_actividad_id]" id="proyecto_actividad_id"
                                data-placeholder="{#field_holder_proyecto_actividad_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.proyecto_actividad selected=$item.proyecto_actividad_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_proyecto_actividad_id#}</span>
                </div>
                *}

                <div class="col-lg-4">
                    <label>{#field_fecha#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="fecha"
                               name="item[fecha]" value="{$item.fecha|date_format:'%d/%m/%Y'}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <input type="hidden" name="item[proyecto_actividad_id]" id="proyecto_actividad_id" value="{$item.proyecto_actividad_id}">
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_fecha#}</span>
                </div>


                <div class="col-lg-4">
                    <label>{#field_total#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_decimal input_money text-right pr-5 "
                               name="item[total]" value="{$item.total|escape:"html"}" required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_money"><i class="fas fa-calculator"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_total#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_unidad#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control  text-right pr-5 "
                               name="unidad" id="unidad_form" value="{$item.unidad}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                    </div>
                </div>

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
