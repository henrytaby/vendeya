{include file="index.css.tpl"}
<div class="card card-custom gutter-b example example-compact">
    <div class="card-body pt-0 pb-0 pl-5 pr-5">
        <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
            <div class="alert-icon"><i class="flaticon-notes"></i></div>
            <div class="alert-text text-justify text-dark-65" >{#message#}</div>
        </div>
    </div>

    <div class="card-header py-3">
        <div class="card-title">
            <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
            <h3 class="card-label text-primary">{#title#}</h3>
        </div>
    </div>
    <!--begin::Form-->
    <form method="POST"
          action="{$path_url}/{$subcontrol}_/{if $type=="update"}{$id}/{/if}save/"
          id="general_form">

        <div class="card-body pt-1 pb-0">
            <div class="form-group row pt-0 pb-0 mb-0">
                <div class="col-lg-6">
                    <label>{#field_inversion_total_bs#} <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[inversion_total_bs]" value="{$item.inversion_total_bs|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_inversion_total_bs#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_inversion_total_bs_mil#}<span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[inversion_total_bs_mil]" value="{$item.inversion_total_bs_mil|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_inversion_total_bs_mil#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_externo_total_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[externo_total_bs]" value="{$item.externo_total_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_externo_total_bs#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_contraparte_local_total_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[contraparte_local_total_bs]" value="{$item.contraparte_local_total_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_contraparte_local_total_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_bol_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[bol_bs]" value="{$item.bol_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_bol_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_PPCR#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ppcr_bs]" value="{$item.ppcr_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_PPCR#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_GAD#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[gad_financiero_bs]" value="{$item.gad_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_GAD#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_gad_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[gad_nofinanciero_bs]" value="{$item.gad_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_gad_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_gam_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[gam_financiero_bs]" value="{$item.gam_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_gam_financiero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_gam_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[gam_nofinanciero_bs]" value="{$item.gam_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_externo_total_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_uf_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[uf_financiero_bs]" value="{$item.uf_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_uf_financiero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_uf_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[uf_nofinanciero_bs]" value="{$item.uf_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_uf_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_otro_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[otro_financiero_bs]" value="{$item.otro_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_otro_financiero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_contraparte_local_nofinanciero#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[contraparte_local_nofinanciero]" value="{$item.contraparte_local_nofinanciero|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_contraparte_local_nofinanciero#}</span>
                </div>

            </div>
        </div>


        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-primary">{#title1#}</h4>
        </div>
        <div class="card-body pt-1 pb-0">
            <div class="form-group row pt-0 pb-0 mb-0">
                <div class="col-lg-6">
                    <label>{#field_contraparte_responsable_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[contraparte_responsable_id]" id="type_select_convenio_vig"
                                data-placeholder="{#field_Holder_contraparte_responsable_id#}" {$privFace.input}

                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option value="0">Ninguno</option>
                            {html_options options=$cataobj.contraparte_responsable selected=$item.contraparte_responsable_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_contraparte_responsable_id#}</span>
                </div>

                <div class="col-lg-6">
                    <label>{#field_ejecutado_total#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_total]" value="{$item.ejecutado_total|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_total#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_pnc_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_pnc_bs]" value="{$item.ejecutado_pnc_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_pnc_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_bol_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_bol_bs]" value="{$item.ejecutado_bol_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_bol_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_ppcr_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_ppcr_bs]" value="{$item.ejecutado_ppcr_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_ppcr_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_gad_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_gad_financiero_bs]" value="{$item.ejecutado_gad_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_gad_financiero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_gad_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_gad_nofinancier_bs]" value="{$item.ejecutado_gad_nofinancier_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_gad_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_gam_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_gam_financiero_bs]" value="{$item.ejecutado_gam_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_gam_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_gam_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_gam_nofinanciero_bs]" value="{$item.ejecutado_gam_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_gam_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_uf_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_uf_financiero_bs]" value="{$item.ejecutado_uf_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_uf_financiero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_uf_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_uf_nofinanciero_bs]" value="{$item.ejecutado_uf_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_uf_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_otro_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_otro_bs]" value="{$item.ejecutado_otro_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_otro_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_ejecutado_contraparte_local_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[ejecutado_contraparte_local_nofinanciero_bs]" value="{$item.ejecutado_contraparte_local_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_ejecutado_contraparte_local_nofinanciero_bs#}</span>
                </div>
            </div>
        </div>


        <div class="card-header pt-0 pb-0">
            <h4 class="card-title pt-3 pb-3 m-0 text-primary">{#title2#}</h4>
        </div>
        <div class="card-body pt-1 pb-0">
            <div class="form-group row  pt-0 pb-0 mb-0">
                <div class="col-lg-4">
                    <label>{#field_saldo_total_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_total_bs]" value="{$item.saldo_total_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_total_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_pnc_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_pnc_bs]" value="{$item.saldo_pnc_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_pnc_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_bol_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_bol_bs]" value="{$item.saldo_bol_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_bol_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_ppcr_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_ppcr_bs]" value="{$item.saldo_ppcr_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_ppcr_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_gad_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_gad_financiero_bs]" value="{$item.saldo_gad_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_gad_financiero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_gad_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_gad_nofinanciero_bs]" value="{$item.saldo_gad_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_gad_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_gam_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_gam_financiero_bs]" value="{$item.saldo_gam_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_gam_financiero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_gam_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_gam_nofinanciero_bs]" value="{$item.saldo_gam_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_gam_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_uf_financiero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_uf_financiero_bs]" value="{$item.saldo_uf_financiero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_uf_financiero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_uf_nofinanciero_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_uf_nofinanciero_bs]" value="{$item.saldo_uf_nofinanciero_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_uf_nofinanciero_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_otro_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_otro_bs]" value="{$item.saldo_otro_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_otro_bs#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_saldo_contraparte_local_nofinanciera_bs#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control "
                               name="item[saldo_contraparte_local_nofinanciera_bs]" value="{$item.saldo_contraparte_local_nofinanciera_bs|escape:"html"}"
                                 
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-coins"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_saldo_contraparte_local_nofinanciera_bs#}</span>
                </div>


            </div>

        </div>

        <div class="card-footer">
            {if $privFace.edit == 1}
                <button type="reset" class="btn btn-primary mr-2" id="general_submit">
                    <i class="la la-save"></i>
                    {#glBtnSaveChanges#}</button>
            {/if}
            <a href="{$path_url}" class="btn btn-light-primary ">
                <i class="la la-angle-double-left"></i>{if $type =="new"} {#glBtnCancel#} {else} {#glBtnBackToList#}{/if}
            </a>
        </div>

    </form>
    <!--end::Form-->
</div>

{include file="index.js.tpl"}