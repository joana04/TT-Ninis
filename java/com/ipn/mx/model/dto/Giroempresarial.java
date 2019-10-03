package com.ipn.mx.model.dto;
// Generated 29/09/2019 12:36:04 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Giroempresarial generated by hbm2java
 */
public class Giroempresarial  implements java.io.Serializable {


     private Integer idGiroEmpresarial;
     private String nombreGiroEmpresarial;
     private String descripcionGiroEmpresarial;
     private Set empresas = new HashSet(0);

    public Giroempresarial() {
    }

	
    public Giroempresarial(String nombreGiroEmpresarial) {
        this.nombreGiroEmpresarial = nombreGiroEmpresarial;
    }
    public Giroempresarial(String nombreGiroEmpresarial, String descripcionGiroEmpresarial, Set empresas) {
       this.nombreGiroEmpresarial = nombreGiroEmpresarial;
       this.descripcionGiroEmpresarial = descripcionGiroEmpresarial;
       this.empresas = empresas;
    }
   
    public Integer getIdGiroEmpresarial() {
        return this.idGiroEmpresarial;
    }
    
    public void setIdGiroEmpresarial(Integer idGiroEmpresarial) {
        this.idGiroEmpresarial = idGiroEmpresarial;
    }
    public String getNombreGiroEmpresarial() {
        return this.nombreGiroEmpresarial;
    }
    
    public void setNombreGiroEmpresarial(String nombreGiroEmpresarial) {
        this.nombreGiroEmpresarial = nombreGiroEmpresarial;
    }
    public String getDescripcionGiroEmpresarial() {
        return this.descripcionGiroEmpresarial;
    }
    
    public void setDescripcionGiroEmpresarial(String descripcionGiroEmpresarial) {
        this.descripcionGiroEmpresarial = descripcionGiroEmpresarial;
    }
    public Set getEmpresas() {
        return this.empresas;
    }
    
    public void setEmpresas(Set empresas) {
        this.empresas = empresas;
    }




}


