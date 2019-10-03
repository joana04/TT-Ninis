<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
                                <label class="col-xs-12">Calle: ${direccion.getCalle()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12">Colonia: ${direccion.getColonia()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12" >Número interior:   ${direccion.getNumeroInterior()} </label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="col-xs-12">Número exterior: ${direccion.getNumeroExterior()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12">Municipio o delegación: ${direccion.getMunicipioDelegacion()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12">Entidad Federal: ${direccion.getEntidadFederal()}</label>
                            </div>
                            <div class="row">
                                <label class="col-xs-12">Código postal: ${direccion.getCodigoPostal()}</label>
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
