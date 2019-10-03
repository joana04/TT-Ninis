package com.ipn.mx.model.dto;
// Generated 29/09/2019 12:36:04 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Gradoestudios generated by hbm2java
 */
public class Gradoestudios  implements java.io.Serializable {


     private Integer idGradoEstudios;
     private String nombreGradoEstudios;
     private String descripcionGradoEstudios;
     private Set becarios = new HashSet(0);

    public Gradoestudios() {
    }

	
    public Gradoestudios(String nombreGradoEstudios) {
        this.nombreGradoEstudios = nombreGradoEstudios;
    }
    public Gradoestudios(String nombreGradoEstudios, String descripcionGradoEstudios, Set becarios) {
       this.nombreGradoEstudios = nombreGradoEstudios;
       this.descripcionGradoEstudios = descripcionGradoEstudios;
       this.becarios = becarios;
    }
   
    public Integer getIdGradoEstudios() {
        return this.idGradoEstudios;
    }
    
    public void setIdGradoEstudios(Integer idGradoEstudios) {
        this.idGradoEstudios = idGradoEstudios;
    }
    public String getNombreGradoEstudios() {
        return this.nombreGradoEstudios;
    }
    
    public void setNombreGradoEstudios(String nombreGradoEstudios) {
        this.nombreGradoEstudios = nombreGradoEstudios;
    }
    public String getDescripcionGradoEstudios() {
        return this.descripcionGradoEstudios;
    }
    
    public void setDescripcionGradoEstudios(String descripcionGradoEstudios) {
        this.descripcionGradoEstudios = descripcionGradoEstudios;
    }
    public Set getBecarios() {
        return this.becarios;
    }
    
    public void setBecarios(Set becarios) {
        this.becarios = becarios;
    }




}


