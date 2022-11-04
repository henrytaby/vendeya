<div class="d-flex flex-column w-100 mr-2">
    <div class="d-flex align-items-center justify-content-between mb-2">
        <span class=" font-size-sm font-weight-bold " style="color: #4c6404;">Total</span>
        <span class=" mr-2 font-size-sm font-weight-bold"  >{$total.total_porcentaje}%</span>
    </div>
    <div class="progress progress-xs w-100">
        <div class="progress-bar bg-primary" role="progressbar" style="width: {$total.total_porcentaje}%;" aria-valuenow="{$total.total_porcentaje}" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
</div>

<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap d-none">
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Programado</span>
            <span class="font-weight-bolder font-size-h5 " style="color: #4f8800;" >{$total.total_aporte|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span> </span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Ejecución</span>
            <span class="font-weight-bolder font-size-h5 text-success">{$total.total_avance|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Saldo por ejecutar</span>
            <span class="font-weight-bolder font-size-h5 text-info">{$total.total_saldo|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->

    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-pie-chart icon-2x font-weight-bold text-primary"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Porcentaje de ejecución del convenio</span>
            <span class="font-weight-bolder font-size-h5 text-primary">{$total.total_porcentaje|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">%</span></span>
        </div>
    </div>
    <!--end: Item-->
</div>

<!--end::Bottom-->







<div class="d-flex flex-column w-100 mr-2">
    <div class="d-flex align-items-center justify-content-between mb-2">
        <span class=" font-size-sm font-weight-bold " style="color: #4c6404;">Aporte Financiero</span>
        <span class=" mr-2 font-size-sm font-weight-bold"  >{$total.aporte_financiero_avance_porcentaje}%</span>
    </div>
    <div class="progress progress-xs w-100">
        <div class="progress-bar bg-success" role="progressbar" style="width: {$total.aporte_financiero_avance_porcentaje}%;" aria-valuenow="{$total.aporte_financiero_avance_porcentaje}" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
</div>

<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap d-none">
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Programado</span>
            <span class="font-weight-bolder font-size-h5 " style="color: #4f8800;" >{$total.aporte_financiero|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span> </span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Ejecución</span>
            <span class="font-weight-bolder font-size-h5 text-success">{$total.aporte_financiero_avance|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Saldo por ejecutar</span>
            <span class="font-weight-bolder font-size-h5 text-info">{$total.aporte_financiero_saldo|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->

    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-pie-chart icon-2x font-weight-bold text-primary"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Porcentaje de ejecución del convenio</span>
            <span class="font-weight-bolder font-size-h5 text-primary">{$total.aporte_financiero_avance_porcentaje|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">%</span></span>
        </div>
    </div>
    <!--end: Item-->
</div>

<!--end::Bottom-->








<div class="d-flex flex-column w-100 mr-2">
    <div class="d-flex align-items-center justify-content-between mb-2">
        <span class=" font-size-sm font-weight-bold text-info">Aporte NO Financiero</span>
        <span class=" mr-2 font-size-sm font-weight-bold text-info" >{$total.aporte_nofinanciero_avance_porcentaje}%</span>
    </div>
    <div class="progress progress-xs w-100">
        <div class="progress-bar bg-info" role="progressbar" style="width: {$total.aporte_nofinanciero_avance_porcentaje}%;" aria-valuenow="{$total.aporte_nofinanciero_avance_porcentaje}" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
</div>

<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap d-none">
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Programado</span>
            <span class="font-weight-bolder font-size-h5 " style="color: #4f8800;" >{$total.aporte_nofinanciero|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span> </span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Ejecución</span>
            <span class="font-weight-bolder font-size-h5 text-success">{$total.aporte_nofinanciero_avance|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Saldo por ejecutar</span>
            <span class="font-weight-bolder font-size-h5 text-info">{$total.aporte_nofinanciero_saldo|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->

    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-pie-chart icon-2x font-weight-bold text-primary"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Porcentaje de ejecución del convenio</span>
            <span class="font-weight-bolder font-size-h5 text-primary">{$total.aporte_nofinanciero_avance_porcentaje|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">%</span></span>
        </div>
    </div>
    <!--end: Item-->
</div>

<!--end::Bottom-->