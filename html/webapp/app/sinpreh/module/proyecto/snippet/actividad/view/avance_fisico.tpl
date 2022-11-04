<div class="d-flex flex-column w-100 mr-2">
    <div class="d-flex align-items-center justify-content-between mb-2">
        <span class=" mr-2 font-size-sm font-weight-bold text-info" >{$item.avance_fisico}%</span>
        <span class="text-muted font-size-sm font-weight-bold">Avance Físico Total</span>
    </div>
    <div class="progress progress-xs w-100">
        <div class="progress-bar bg-info" role="progressbar" style="width: {$item.avance_fisico}%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
</div>