<div class="d-flex flex-column w-100 mr-2">
    <div class="d-flex align-items-center justify-content-between mb-2">
        <span class=" mr-2 font-size-sm font-weight-bold text-info" >{$total.avance_financiero}%</span>
        <span class="text-muted font-size-sm font-weight-bold">Avance Financiero Total</span>
    </div>
    <div class="progress progress-xs w-100">
        <div class="progress-bar bg-info" role="progressbar" style="width: {$total.avance_financiero}%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
</div>


<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap">
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Aporte Financiero</span>
            <span class="font-weight-bolder font-size-h5 text-info" >{$total.aporte_financiero|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span> </span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Aporte No Financiero</span>
            <span class="font-weight-bolder font-size-h5 text-info">{$total.aporte_nofinanciero|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Aporte</span>
            <span class="font-weight-bolder font-size-h5" style="color: #4f8800;">{$total.total|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->

    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-pie-chart icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Porcentaje</span>
            <span class="font-weight-bolder font-size-h5 text-primary">{$total.porcentaje} <span class="text-dark-50 font-weight-bold">%</span></span>
        </div>
    </div>
    <!--end: Item-->
</div>
<!--end::Bottom-->