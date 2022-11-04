<div class="row alert alert-custom alert-light-primary fade show m-0 pr-0 pl-0 pt-0 pb-5 " role="alert" >
    <div class="col-lg-12 alert-text">
        <label>{#filter_entidad#}:</label>
        <select class="form-control select2_general fitrodato" id="entidad" data-col-index="0" >
            <option value="0">{#filter_entidad_opt#}</option>
            {html_options options=$cataobj.financiador}
        </select>
    </div>

    {*
    <div class="col-lg-6 alert-text">
        <label>{#filterAppStatus#}:</label>
        <select class="filtro-buscar form-control select2_busqueda" data-col-index="8">
            <option value="5">{#filterAppStatusSelectAll#}</option>
            {html_options options=$cataobj.activo}
        </select>
    </div>
    *}
</div>
<div class="m-separator m-separator--md m-separator--dashed"></div>
