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
                        <div class="form-group">
                            <h2>Datos de la empresa</h2>
                            <hr>
                            <div class="form-group">
                                <label for="rfc">RFC: <%= e.getRfc()%></label>
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre: <%= e.getNombreEmpresa()%></label>    
                            </div>
                            <div class="form-group">
                                <label for="giro">Giro: <%= e.getGiro()%></label>
                            </div>
                            <div class="form-group">
                                <label for="noEmpleados">No. de empleados: <%= e.getNumeroEmpleados()%></label>
                            </div>
                            <a type="submit" href="EditarEmpresa.jsp?id=<%=e.getRfc()%>">Actualizar empresa</a>
                        </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
    </body>
</html>
