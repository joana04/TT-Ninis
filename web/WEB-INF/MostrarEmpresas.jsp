<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="shared/header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="shared/navbar.jsp" %>
        <div id="app">
            <div class="container animated fadeIn delay-100ms" >
                <div class="row">
                    <div class="col-12">
                        <table class='table table-hover'>
                            <tr class='table-light'>
                                <th scope='col'>RFC</th>
                                <th scope='col'>Nombre de la empresa</th>
                                <th scope='col'>Giro</th>
                                <th scope='col'>Número de empleados</th>
                                <th scope='col'>Acciones</th>
                            </tr>
                            <c:forEach var="e" items="${Empresas}">
                                <tr>
                                    <td><c:out value="${e.getRfc()}"></c:out></td>
                                    <td><c:out value="${e.getNombreEmpresa()}"></c:out></td>
                                    <td><c:out value="${e.getGiro()}"></c:out></td>
                                    <td><c:out value="${e.getNumeroEmpleados()}"></c:out></td>
                                    <td>
                                        <a class='btn btn-outline-info btn-sm' href="MostrarEmpresa.htm?id=${e.getRfc()}"> <span class='pe-7s-info'></span> </a>
                                        <a class='btn btn-outline-info btn-sm' href="EditarEmpresa.htm?id=${e.getRfc()}"> <span class='pe-7s-pen'></span> </a>
                                        <a class='btn btn-outline-danger btn-sm btnEliminarCarrera txt-white' href="deleteEmpresa.htm?id=${e.getRfc()}"> <span class='pe-7s-trash'></span> </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <button onclick="redirect()" type="button" data-toggle="modal" data-target="#btnModalAgregar" class='btn btn-lg btn-outline-success btn-block'>
                         Agregar Empresa <span class='pe-7s-plus'></span>
                    </button>
                </div>
            </div>
        </div>
        <script>
            function redirect() {
              document.location.replace("AgregarEmpresa.htm");
            }
        </script>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
    </body>
</html>

