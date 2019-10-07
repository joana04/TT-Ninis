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
        <%@ include file="shared/navbarAdmin.jsp" %>
        <div id="app">
            <div class="container animated fadeIn delay-100ms" >
                <div class="row">
                    <div class="col-12">
                        <table class='table table-hover'>
                            <tr class='table-light'>
                                <th scope='col'>CURP</th>
                                <th scope='col'>Nombre del becario</th>
                                <th scope='col'>Correo</th>
                                <th scope='col'>Estado</th>
                                <th scope='col'>Acciones</th>
                            </tr>
                            <c:forEach var="becario" items="${becarios}">
                                <tr>
                                    <td><c:out value="${becario.getCurp()}"></c:out></td>
                                    <td><c:out value="${becario.getNombreBecario()}"></c:out></td>
                                    <td><c:out value="${becario.getUsuario().getCorreo()}"></c:out></td>
                                    <td><c:out value=""></c:out></td>
                                    <td>
                                        <a class='btn btn-outline-info btn-sm' title="Ver información del becario." href="MostrarBecarioAdmin.htm?id=${becario.getCurp()}"> <span class='pe-7s-info'></span> </a>
                                        <!--a class='btn btn-outline-info btn-sm' title="Editar información del becario." href="EditarInfoBecarioAdmin.htm?id=${becario.getCurp()}"> <span class='pe-7s-pen'></span> </a>
                                        <a class='btn btn-outline-info btn-sm' title="Editar ubicación del becario." href="EditarUbicacionBecarioAdmin.htm?id=${becario.getCurp()}"> <span class='pe-7s-map-marker'></span> </a>
                                        --><a class='btn btn-outline-danger btn-sm txt-white' href="BorrarBecarioAdmin.htm?id=${becario.getCurp()}"> <span class='pe-7s-trash'></span> </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!--button onclick="redirect()" type="button" data-toggle="modal" data-target="#btnModalAgregar" class='btn btn-lg btn-outline-success btn-block'>
                         Agregar Empresa <span class='pe-7s-plus'></span>
                    </button-->
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

