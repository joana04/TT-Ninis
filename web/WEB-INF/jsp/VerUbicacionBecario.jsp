<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Ver ubicación becario</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body >
        <!-- Navbar -->
        <!--%@ include file="shared/navbarBecario.jsp" %-->
            
        <div class="container">
            <div class="row ">
                <div class="col-10 center-auto">
                        <div class="form-group">
                            <h5> Dirección </h5>
                            <hr>
                            <div class="row">
                                <label class="col-xs-12">Calle: ${becario.getDireccion().getCalle()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12">Colonia: ${becario.getDireccion().getColonia()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12" >Número interior:   ${becario.getDireccion().getNumeroInterior()} </label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="col-xs-12">Número exterior: ${becario.getDireccion().getNumeroExterior()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12">Municipio o delegación: ${becario.getDireccion().getMunicipioDelegacion()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12">Entidad Federal: ${becario.getDireccion().getEntidadFederal()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12">Código postal: ${becario.getDireccion().getCodigoPostal()}</label>
                            </div> 
                        </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <!--%@ include file="shared/footer.jsp" %-->
        <script type="text/javascript">
            function editarUbicacion(){
                document.location.replace("EditarBecarioUbicacion.htm");
            }
    
            function cancelarOperacion(){
                document.location.replace("InicioBecario.htm");
            }
        </script>
    </body>
</html>
