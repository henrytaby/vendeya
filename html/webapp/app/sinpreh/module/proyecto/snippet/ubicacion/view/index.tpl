{include file="formprincipal/index.tpl"}

<div class="card card-custom">
    <!--begin:Titulo-->
    <div class="card-header py-0 my-0">
        <div class="card-title">
            <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
            <h3 class="card-label text-dark-50">{#title#}</h3>
        </div>
        <div class="card-toolbar">
            {if $privFace.edit == 1 and $privFace.add == 1}
                <a href="#" class="btn btn-success font-weight-bolder" id="btn_form_{$subcontrol}" rel="new">
                    <span><i class="fa fa-plus"></i><span> {#btnNew#}</a>
            {/if}
        </div>
    </div>
    <!--end:Titulo-->
    <!--begin: Lista de Datos-->
    <div class="card-body mt-0 pt-0">
        {*include file="index.search.tpl"*}
        <!--begin: Datatable-->
        <table class="table {*table-separate table-striped*}  table-bordered table-hover table-head-custom table-checkable d-none table-sm  "
               id="tabla_{$subcontrol}" >
            <thead class="thead-dark thead-color">
            <tr>
                {foreach from=$gridItem item=row key=idx}
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

</div>
<!--begin::Modal-->
<div class="modal fade" id="form_modal_{$subcontrol}"
     data-backdrop="static" tabindex="-1" role="dialog"
     aria-labelledby="staticBackdrop" aria-hidden="true"
     >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-lg" id="modal-content_{$subcontrol}">
        </div>
    </div>
</div>
<!--end::Modal-->
{include file="index.js.tpl"}