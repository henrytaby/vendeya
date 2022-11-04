{include file="form/addunidad/form.css.tpl"}
<form method="POST"
      action="{$path_url}/{$subcontrol}_//saveaddunidad/"
      id="form_{$subcontrol}_peque">

    <div class="modal-body p-2">
        <div class="alert alert-info" role="alert">
            {#glnew#} {#title#}
        </div>

        <div class="form-group row mb-0">
            <div class="col-lg-12">
                <label>{#field_nombre#}   <span class="text-danger bold">*</span>:</label>
                <input type="text" class="form-control"
                       name="item[nombre]"
                       value="{$item.nombre|escape:"html"}"
                       required {$privFace.input}
                       data-fv-not-empty___message="{#glFieldRequired#}"
                >
                <span class="form-text text-black-50">{#field_msg_nombre#}</span>
            </div>

            <div class="col-lg-12">
                <label>{#field_descripcion#}   <span class="text-danger bold">*</span>:</label>
                <input type="text" class="form-control"
                       name="item[descripcion]"
                       value="{$item.descripcion|escape:"html"}"
                       required {$privFace.input}
                       data-fv-not-empty___message="{#glFieldRequired#}"
                >
                <span class="form-text text-black-50">{#field_msg_descripcion#}</span>
            </div>
        </div>
    </div>

    <div class="modal-footer p-2">
        {if $privFace.edit == 1}
            <button type="button" class="btn btn-info font-weight-bold" id="form_submit_{$subcontrol}_peque">
                <i class="la la-save"></i>{#glBtnSave#}</button>
        {/if}
        <button type="button" class="btn btn-light-info" id="form_close_{$subcontrol}_peque" data-dismiss="modal">
            <i class="la la-angle-double-left"></i>{#glBtnCloce#}</button>
    </div>
</form>

{include file="form/addunidad/form.js.tpl"}
