<!--begin:Titulo-->
<div class="card-header py-3">
    <div class="card-title">
        <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span><h3 class="card-label text-dark-50">{#title_02#}</h3>
    </div>
    <div class="card-toolbar">
        {if $privFace.edit == 1 and $privFace.add == 1}
            <a href="#" class="btn btn-success font-weight-bolder" id="btn_form_02_{$subcontrol}" rel="new"> <span><i class="fa fa-plus"></i><span> {#btnNew_02#}</a>
        {/if}
    </div>
</div>
<!--end:Titulo-->

<!--begin: Lista de Datos-->
<div class="card-body pt-1">
    {*include file="index.search.tpl"*}
    <!--begin: Datatable-->
    <table class="table {*table-separate table-striped*}  table-bordered table-hover table-head-custom table-checkable d-none table-sm  "
           id="tabla_02_{$subcontrol}" >
        <thead class="thead-dark thead-color">
        <tr>
            {foreach from=$gridItem_02 item=row key=idx}
                <th>{$row.label|escape:"html"}</th>
            {/foreach}
        </tr>
        </thead>
        <tbody></tbody>
        <tfoot></tfoot>
    </table>
    <!--end: Datatable-->
</div>
<!--end: Lista de Datos-->

{include file="ejecucion/index.js.tpl"}