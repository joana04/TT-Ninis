<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body>
        <!-- Navbar -->
        <%@ include file="shared/navbar.jsp" %>

        <div class="container animated fadeIn delay-10ms">
            <div class="row ">
                <div class="col-12">
                    <h2>Vinculación Laboral</h2>
                    <hr>
                </div>
                <div class="col-md-4 col-xs-12">
                    <div class="card border-info mb-3" style="max-width: 20rem;">
                        <div class="card-header"> </div>
                        <div class="card-body">
                          <h4 class="card-title">Empresas</h4>
                          <p class="card-text">Empresas registradas en el sistema.</p>
                          <a href="MostrarEmpresas.jsp" class="btn btn-lg btn-outline-info btn-block">Revisar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12 ">
                    <div class="card border-warning mb-3" style="max-width: 20rem;">
                        <div class="card-header"></div>
                        <div class="card-body">
                          <h4 class="card-title">Vacantes</h4>
                          <p class="card-text">Vacantes registradas por las empresas.</p>
                          <a href="mostrarCarreras.jsp" class="btn btn-lg btn-outline-warning btn-block">Revisar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <div class="card border-success mb-3" style="max-width: 20rem;">
                        <div class="card-header"></div>
                        <div class="card-body">
                          <h4 class="card-title">Personas</h4>
                          <p class="card-text">Personas registradas en el sistemas.</p>
                          <a href="datos.jsp" class="btn btn-lg btn-outline-success btn-block">Revisar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
    </body>
</html>
