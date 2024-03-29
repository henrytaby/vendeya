<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap">

    {foreach from=$res.tipo item=row key=idx}
        <!--begin: Item-->
        <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
            <span class="mr-4"><i class="fas fa-money-bill-alt icon-2x text-muted "></i></span>
            <div class="d-flex flex-column text-dark-75">
                <span class="font-weight-bolder font-size-sm">{if $row.tipo==""}Sin Clasificar{else}{$row.tipo}{/if} </span>
                <span class="font-weight-bolder font-size-h5 text-info" >{$row.total|number_format:2:',':'.'} <span class="text-dark-50 font-weight-bold">bs.</span> </span>
            </div>
        </div>
        <!--end: Item-->
    {/foreach}
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="fas fa-money-bill-alt icon-2x text-muted "></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total</span>
            <span class="font-weight-bolder font-size-h5 text-success" >{$res.total|number_format:2:',':'.'} <span class="text-dark-50 font-weight-bold">bs.</span> </span>
        </div>
    </div>
    <!--end: Item-->
</div>
<!--end::Bottom-->