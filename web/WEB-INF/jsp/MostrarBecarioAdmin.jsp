<%-- 
    Document   : VerInfoBecario
    Created on : 30/09/2019, 09:37:36 PM
    Author     : lm107
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar empresa</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body >        
    <%@ include file="shared/navbarAdmin.jsp" %>
        
        <div class="container">
            <div class="row">
                <div class="col-10 center-auto">
                    <!--h2>Datos del becario</h2-->
                    <hr>
                    <h5> Información del usuario </h5> 
                    <hr>
                    <div class="col-xs-6">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12" >Correo: ${becario.getUsuario().getCorreo()}</label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12"></label>
                            </div>
                        </div><br>
                        <h5> Información personal </h5> 
                        <hr>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12" >Nombre: ${becario.getNombreBecario()} ${becario.getPaternoBecario()} ${becario.getMaternoBecario()}</label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">CURP: ${becario.getCurp()}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12" >Edad: ${becario.getEdad()}</label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Número de seguridad social: ${becario.getNumeroSeguridadSocial()}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12" >Telefóno: ${becario.getTelefono()}</label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Celular: ${becario.getCelular()}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12" >Discapacidad: ${becario.getDiscapacidades().getNombreDiscapacidad()}</label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12"></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Grado de estudios: ${becario.getGradoestudios().getNombreGradoEstudios()} </label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Cuenta con certificado:
                                    <c:choose>
                                        <c:when test="${becario.isCertificado()}">Sí.</c:when>
                                        <c:otherwise>No.</c:otherwise>
                                    </c:choose>
                                </label>
                            </div>
                        </div><br>
                        <h5> Ubicación </h5> 
                        <hr>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Calle: ${becario.getDireccion().getCalle()} </label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Colonia: ${becario.getDireccion().getColonia()}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Número exterior: ${becario.getDireccion().getNumeroExterior()} </label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Número interior: ${becario.getDireccion().getNumeroInterior()}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Delegación o municipio: ${becario.getDireccion().getMunicipioDelegacion()} </label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Entidad Federal: ${becario.getDireccion().getEntidadFederal()}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12">Código postal: ${becario.getDireccion().getCodigoPostal()} </label>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <label class="col-xs-12"></label>
                            </div>
                        </div>
                            <br>
                        <h5> Perfil profesional </h5> 
                        <hr><br>
                        <h5> Historial </h5> 
                        <hr>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <!--%@ include file="shared/footer.jsp" %-->
    </body>
</html>

