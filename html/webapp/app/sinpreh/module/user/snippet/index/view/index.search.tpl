<div class="row">
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterName#}:</label>
        <input type="text" class="filtro-buscar-text form-control" placeholder="{#filterName#}" data-col-index="0">
    </div>
    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filterLastName#}:</label>
        <input type="text" class="filtro-buscar-text form-control" placeholder="{#filterLastName#}" data-col-index="1">
    </div>


    <div class="col-lg-12 alert-text">
        <label class="text-dark-25">{#filter_type#}:</label>
        <select class="form-control select2_filter1 filter_select" id="filter_type">
            <option value="no">{#filter_all_type#}</option>
            {html_options options=$cataobj.tipo}
        </select>
    </div>

</div>

