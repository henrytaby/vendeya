<div class="row">
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterPrograma#}:</label>
        <select class="filtro-buscar form-control select2_busqueda"  data-col-index="0" >
            <option value="0">{#filterProgarmaAll#}</option>
            {html_options options=$cataobj.programa}
        </select>
    </div>
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filter_estado#}:</label>
        <select class="filtro-buscar form-control select2_busqueda"  data-col-index="4" >
            <option value="0">{#filter_all_estado#}</option>
            {html_options options=$cataobj.estado}
        </select>
    </div>

    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterCodigo#}:</label>
        <input type="text" class="filtro-buscar-text form-control"
               placeholder="{#filterHolderCodigo#}" data-col-index="1">
    </div>
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterNombre#}:</label>
        <input type="text" class="filtro-buscar-text form-control"
               placeholder="{#filterHolderNombre#}" data-col-index="2">
    </div>


    <!--<div class="col-lg-4 alert-text">
        <label>{#filterStatus#}:</label>
        <select class="filtro-buscar form-control select2_busqueda"  data-col-index="3">
            <option value="3">{#filterAppStatusSelectAll#}</option>
            {html_options options=$cataobj.activo}
        </select>
    </div>-->

</div>

