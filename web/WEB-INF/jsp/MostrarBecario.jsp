<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar empresa</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body >
        <!-- Navbar -->
        <%@ include file="shared/navbar.jsp" %>
        
        <div class="container">
            <div class="row ">
                <div class="col-5 center-auto">
                        <div class="form-group">
                            <h2>Datos de la empresa</h2>
                            <hr>
                            <div class="form-group">
                                <label for="rfc">RFC: ${empresa.getRfc()}</label>
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre: ${empresa.getNombreEmpresa()}</label>    
                            </div>
                            <div class="form-group">
                                <label for="giro">Giro: ${empresa.getGiro()}</label>
                            </div>
                            <div class="form-group">
                                <label for="noEmpleados">No. de empleados: ${empresa.getNumeroEmpleados()}</label>
                            </div>
                            <a type="submit" href="EditarEmpresa.htm?id=${empresa.getRfc()}">Actualizar empresa</a>
                            
                            </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
    </body>
</html>
