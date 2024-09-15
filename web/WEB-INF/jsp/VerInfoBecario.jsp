<%-- 
    Document   : VerInfoBecario
    Created on : 30/09/2019, 09:37:36 PM
    Author     : lm107
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar empresa</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body >        
    <!--%@ include file="shared/navbarBecario.jsp" %-->
        
        <div class="container">
            <div class="row">
                <div class="col-10 center-auto">
                    <!--h2>Datos del becario</h2-->
                    <hr>
                    <h5> Información personal </h5> 
                    <hr>
                    <div class="row">    
                        <label>Nombre: ${becario.getNombreBecario()} ${becario.getPaternoBecario()} ${becario.getMaternoBecario()}</label>
                    </div> 
                    <div class="row">
                        <label class="col-xs-12">CURP: ${becario.getCurp()}</label>
                    </div>
                    <div class="row">
                        <label class="col-xs-12">Edad: ${becario.getEdad()}</label>
                    </div>
                    <div class="row">
                        <label class="col-xs-12">Número de seguridad social: ${becario.getNumeroSeguridadSocial()}</label>
                    </div>
                    <div class="row">
                        <label class="col-xs-12">Edad: ${becario.getTelefono()}</label>
                    </div>
                    <div class="row">
                        <label class="col-xs-12">Celular: ${becario.getTelefono()}</label>
                    </div>
                    <div class="row">
                        <label class="col-xs-12">Discapacidad: ${becario.getDiscapacidades().getNombreDiscapacidad()}</label>
                    </div>
                    <br><br>
                    <h5> Información académica</h5>
                    <hr>
                    <div class="row">
                        <label class="col-xs-12">Grado de estudios: ${becario.getGradoestudios().getNombreGradoEstudios()} </label>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <!--%@ include file="shared/footer.jsp" %-->
    </body>
</html>

