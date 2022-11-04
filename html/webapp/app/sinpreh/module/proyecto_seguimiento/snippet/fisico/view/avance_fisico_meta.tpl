<div class="d-flex flex-column w-100 mr-2">
    <div class="d-flex align-items-center justify-content-between mb-2">
        <span class=" font-size-sm font-weight-bold">{$item.detalle}</span>
        <span class=" mr-2 font-size-sm font-weight-bold text-info" >{$item.avance_fisico}%</span>
    </div>
    <div class="progress progress-xs w-100">
        <div class="progress-bar bg-success" role="progressbar" style="width: {$item.avance_fisico}%;" aria-valuenow="{$item.avance_fisico}" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
</div>
<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap">
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-layers icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Meta</span>
            <span class="font-weight-bolder font-size-h5 text-warning" >{$item.total|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold"></span> </span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-layers icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Avance</span>
            <span class="font-weight-bolder font-size-h5 text-success">{$item.avance_total|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold"></span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-interface-1 icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Unidad</span>
            <span class="font-weight-bolder font-size-h5" style="color: #4f8800;" id="unidad_texto">{$item.unidad} <span class="text-dark-50 font-weight-bold"></span></span>
        </div>
    </div>
    <!--end: Item-->





    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-pie-chart icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Porcentaje</span>
            <span class="font-weight-bolder font-size-h5 text-primary">{$item.avance_fisico} <span class="text-dark-50 font-weight-bold">%</span></span>
        </div>
    </div>
    <!--end: Item-->
</div>
<!--end::Bottom-->
