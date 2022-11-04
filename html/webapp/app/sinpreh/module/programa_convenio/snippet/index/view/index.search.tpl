<div class="row">
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterName#}:</label>
        <select class="filtro-buscar form-control select2_busqueda" data-col-index="0">
            <option value="0">{#filterNameSelectAll#}</option>
            {html_options options=$cataobj.programa}

        </select>
    </div>



    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterCodigo#}:</label>
        <input type="text" class="filtro-buscar-text form-control"
               placeholder="{#filterHolderCodigo#}" data-col-index="1">
    </div>
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterFinanciadora#}:</label>
        <select class="filtro-buscar form-control select2_busqueda" data-col-index="3">
            <option value="0">{#filterFinanciadoraSelectAll#}</option>
            {html_options options=$cataobj.programa_convenio_financiador}

        </select>
    </div>
</div>

