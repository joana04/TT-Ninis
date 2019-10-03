<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body>
        <!-- Navbar -->
        <%@ include file="shared/navbarBecario.jsp" %>

        <div class="container animated fadeIn delay-10ms">
            <div class="row ">
                <div class="col-12">
                    <h2>Vinculación Laboral - ${becario.getNombreBecario()} ${becario.getDireccion().getCalle()}</h2>
                    <hr>
                </div>
                <div class="col-md-4 col-xs-12"> 
                    <div class="card border-info mb-3" style="max-width: 20rem;">
                        <div class="card-header"> </div>
                        <div class="card-body">
                          <h4 class="card-title">Información General</h4>
                          <p class="card-text">Ver mi información</p>
                          <a href="#" class="btn btn-lg btn-outline-info btn-block" data-toggle="modal" data-target="#modalInfoBecario">Revisar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <div class="card border-info mb-3" style="max-width: 20rem;">
                        <div class="card-header"> </div>
                        <div class="card-body">
                          <h4 class="card-title">Ubicación</h4>
                          <p class="card-text">Ver mi información geográfica</p>
                          <a href="#" class="btn btn-lg btn-outline-info btn-block openModalUbicacionBecario" data-toggle="modal" data-target="#modalUbicacionBecario">Revisar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <div class="card border-info mb-3" style="max-width: 20rem;">
                        <div class="card-header"> </div>
                        <div class="card-body">
                          <h4 class="card-title">Documentos</h4>
                          <p class="card-text">Registrar documentos</p>
                          <a href="MostrarBecario.htm" class="btn btn-lg btn-outline-info btn-block">Revisar</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-xs-12 ">
                    <div class="card border-warning mb-3" style="max-width: 20rem;">
                        <div class="card-header"></div>
                        <div class="card-body">
                          <h4 class="card-title">Perfil Laboral</h4>
                          <p class="card-text">Registrar mi formación profesional.</p>
                          <a href="MostrarEmpresas.htm" class="btn btn-lg btn-outline-warning btn-block">Revisar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <div class="card border-warning mb-3" style="max-width: 20rem;">
                        <div class="card-header"></div>
                        <div class="card-body">
                          <h4 class="card-title">Vacantes seleccionadas</h4>
                          <p class="card-text">Vacantes a las cuales he aplicado.</p>
                          <a href="MostrarEmpresas.htm" class="btn btn-lg btn-outline-warning btn-block">Revisar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <div class="card border-warning mb-3" style="max-width: 20rem;">
                        <div class="card-header"></div>
                        <div class="card-body">
                          <h4 class="card-title">Vacantes ofertadas</h4>
                          <p class="card-text">Buscar vacantes</p>
                          <a href="MostrarEmpresas.htm" class="btn btn-lg btn-outline-warning btn-block">Revisar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
            </div>
        </div>
    </div>
</div>
<!-- Modal Ver InformacionBecario-->
<div id="modalInfoBecario" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <!-- Contenido del modal -->
        <div class="modal-content">
            <div class="modal-header">
                <label>Datos del becario</label><button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <%@ include file="VerInfoBecario.jsp" %>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-lg btn-outline-danger" data-dismiss="modal" value="Cerrar"/>
              <input onclick="editarBecario()" type="button" class="btn btn-lg btn-outline-info" value="Editar" />
            </div>
        </div>
    </div>
</div>
            
<div id="modalUbicacionBecario" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <!-- Contenido del modal -->
        <div class="modal-content">
            <div class="modal-header">
                <h5>Datos del becario ${becario.getNombreBecario()}</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <%@ include file="VerUbicacionBecario.jsp" %>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-lg btn-outline-danger" data-dismiss="modal" value="Cerrar"/>
              <input onclick="editarUbicacionBecario()" type="button" class="btn btn-lg btn-outline-info" value="Editar" />
            </div>
        </div>
    </div>
</div>
      
<script>
    $("#modalInfoBecario").modal("show");
    $("#modalUbicacionBecario").modal("show");
    function editarBecario(){
        document.location.replace("EditarBecario.htm");
    }
    function editarUbicacionBecario(){
        document.location.replace("EditarBecarioUbicacion.htm");
    }
</script>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
    </body>
</html>
