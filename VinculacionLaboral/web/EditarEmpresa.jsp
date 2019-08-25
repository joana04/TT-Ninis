<%@page import="com.ipn.mx.modelo.Empresa"%>
<%@page import="com.ipn.mx.modeloDAO.EmpresaDAO"%>
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
                    <%  Empresa e = new Empresa();
                        String txtRfc = request.getParameter("id");
                        e.setRfc(txtRfc);
                        EmpresaDAO ed=new EmpresaDAO();
                        e=ed.find(e);
                    %>
                    <form action="EditarEmpresa" method="get" >
                        <div class="form-group">
                            <h2>Datos de la empresa</h2>
                            <hr>
                            <div class="form-group">
                                <label for="rfc">RFC</label>
                                <input type="text" class="form-control" id="txtRfc" name="txtRfc" value="<%= e.getRfc()%>" placeholder="Ej. XAXX010101000" readonly="true"/>
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="txtNombreEmpresa" name="txtNombreEmpresa" value="<%= e.getNombreEmpresa()%>" placeholder="Ingresa el nombre de la empresa" required>
                            </div>
                            <div class="form-group">
                                <label for="giro">Giro</label>
                                <input type="text" class="form-control" id="txtGiro" name="txtGiro" value="<%= e.getGiro()%>" required/>
                            </div>
                            <div class="form-group">
                                <label for="noEmpleados">No. de empleados</label>
                                <input type="number" class="form-control" id="txtNoEmpledados" name="txtNoEmpledados" value="<%= e.getNumeroEmpleados()%>" placeholder="1" required>
                            </div>
                            <button type="submit" class="btn btn-lg btn-outline-info btn-block">Actualizar empresa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
    </body>
</html>
