
<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap d-none">

    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Transferencia Programada (MMAyA)</span>
            <span class="font-weight-bolder font-size-h5" style="color: #4f8800;">{$total.mmaya|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Transfererido</span>
            <span class="font-weight-bolder font-size-h5" style="color: #4f8800;">{$total.mmaya_total|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->



    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Ejecución</span>
            <span class="font-weight-bolder font-size-h5 text-success" >{$total.mmaya_ejecucion|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span> </span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Total Devoluciones</span>
            <span class="font-weight-bolder font-size-h5 " style="color:red;">{$total.mmaya_devolucion|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->

</div>
<!--end::Bottom-->




<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap d-none">

    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Saldo a transferir</span>
            <span class="font-weight-bolder font-size-h5 text-info">{$total.saldo_transferir|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-piggy-bank icon-2x text-muted font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Saldo por ejecutar</span>
            <span class="font-weight-bolder font-size-h5 text-info">{$total.saldo_porejecutar|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">Bs.</span></span>
        </div>
    </div>
    <!--end: Item-->
</div>
<!--end::Bottom-->


<!--begin::Bottom-->
<div class="d-flex align-items-center flex-wrap d-none">
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-pie-chart icon-2x text-primary font-weight-bold"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Porcentaje de Transferencia</span>
            <span class="font-weight-bolder font-size-h5 text-primary">{$total.mmaya_porcentaje|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">%</span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-pie-chart icon-2x text-mute font-weight-bold text-primary"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Porcentaje de ejecución de monto transferido</span>
            <span class="font-weight-bolder font-size-h5 text-primary">{$total.mmaya_ejecucion_porcentaje|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">%</span></span>
        </div>
    </div>
    <!--end: Item-->
    <!--begin: Item-->
    <div class="d-flex align-items-center flex-lg-fill mr-5 my-1">
        <span class="mr-4"><i class="flaticon-pie-chart icon-2x text-mute font-weight-bold text-primary"></i></span>
        <div class="d-flex flex-column text-dark-75">
            <span class="font-weight-bolder font-size-sm">Porcentaje de ejecución del convenio</span>
            <span class="font-weight-bolder font-size-h5 text-primary">{$total.mmaya_ejecucion_porcentaje_total|number_format:2:'.':','} <span class="text-dark-50 font-weight-bold">%</span></span>
        </div>
    </div>
    <!--end: Item-->
</div>
<!--end::Bottom-->