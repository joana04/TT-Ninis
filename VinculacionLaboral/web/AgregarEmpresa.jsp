<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar empresa</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body >
        <!-- Navbar -->
        <%@ include file="shared/navbar.jsp" %>
        
        <div class="container">
            <div class="row ">
                <div class="col-5 center-auto">
                    <form action="AgregarEmpresa" method="get" >
                        <div class="form-group">
                            <h2>Datos de la empresa</h2>
                            <hr>
                            <div class="form-group">
                                <label for="rfc">RFC</label>
                                <input type="text" class="form-control" id="txtRfc" name="txtRfc" placeholder="Ej. XAXX010101000" required>
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="txtNombreEmpresa" name="txtNombreEmpresa" placeholder="Ingresa el nombre de la empresa" required>
                            </div>
                            <div class="form-group">
                                <label for="giro">Giro</label>
                                <input type="text" class="form-control" id="txtGiro" name="txtGiro" required/>
                            </div>
                            <div class="form-group">
                                <label for="noEmpleados">No. de empleados</label>
                                <input type="number" class="form-control" id="txtNoEmpledados" name="txtNoEmpledados" placeholder="1" required>
                            </div>
                            <button type="submit" class="btn btn-lg btn-outline-info btn-block">Agregar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
    </body>
</html>
