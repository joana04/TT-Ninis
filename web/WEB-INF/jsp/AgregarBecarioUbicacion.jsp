<%@page contentType="text/html" pageEncoding="utf-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar becario</title>
        <%@ include file="shared/header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    </head>
    <body >
        <!-- Navbar -->
        <%@ include file="shared/navbar.jsp" %>
            
        <div class="container">
            <div class="row ">
                <div class="col-10 center-auto">
                    <!--form:form action="addDireccion.htm" modelAttribute="direccionBecario"-->
                    <form action='addDireccion.htm' method="POST" >
                        <div class="form-group">
                            <h2>Datos del becario ${becario.getNombreBecario()}</h2>
                            <input name="curp" value="${becario.getCurp()}" style="display: none;"/>
                            <hr>
                            <h5> Dirección </h5>
                            <hr>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12" >Calle </label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Número exterior</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text" 
                                               name="calle" required/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text" 
                                               name="numeroExterior" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Número interior</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Colonia</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text" 
                                               name="numeroInterior"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6" >
                                        <input class="form-control" type="text" 
                                               name="colonia" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Municipio o delegación</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Entidad</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text" 
                                               name="municipioDelegacion" 
                                               pattern="[a-zA-Z ]{1,60}" 
                                               required/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <select id="entidadSelect" name="entidadFederal">
                                            <option value="Aguascalientes">Aguascalientes</option>
                                            <option value="Baja California">Baja California</option>
                                            <option value="Baja California Sur">Baja California Sur</option>
                                            <option value="Campeche">Campeche</option>
                                            <option value="Coahuila">Coahuila</option>
                                            <option value="Colima">Colima</option>
                                            <option value="Chiapas">Chiapas</option>
                                            <option value="Chihuahua">Chihuahua</option>
                                            <option value="Ciudad de México">Cuidad de México</option>
                                            <option value="Durango">Durango</option>
                                            <option value="Guanajuato">Guanajuato</option>
                                            <option value="Guerrero">Guerrero</option>
                                            <option value="Hidalgo">Hidalgo</option>
                                            <option value="Jalisco">Jalisco</option>
                                            <option value="México">México</option>
                                            <option value="Michoacán">Michoacán</option>
                                            <option value="Morelos">Morelos</option>
                                            <option value="Nayarit">Nayarit</option>
                                            <option value="Nuevo León">Nuevo León</option>
                                            <option value="Oaxaca">Oaxaca</option>
                                            <option value="Puebla">Puebla</option>
                                            <option value="Querétaro">Querétaro</option>
                                            <option value="Quintana Roo">Quintana Roo</option>
                                            <option value="San Luis Potosí">San Luis Potosí</option>
                                            <option value="Sinaloa">Sinaloa</option>
                                            <option value="Sonora">Sonora</option>
                                            <option value="Tabasco">Tabasco</option>
                                            <option value="Tamaluipas">Tamaluipas</option>
                                            <option value="Tlaxcala">Tlaxcala</option>
                                            <option value="Veracruz">Veracruz</option>
                                            <option value="Yucatán">Yucatán</option>
                                            <option value="Zacatecas">Zacatecas</option>
                                        </select>                              
                                    </div>
                                </div>
                            </div>
                            <br>    
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Código postal</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text" 
                                               name="codigoPostal" 
                                               oninvalid="this.setCustomValidity('CP invalido.')"
                                               oninput="this.setCustomValidity('')"
                                               pattern="[0-9]+[1-9]+[0-9]{3}"
                                               required/>
                                    </div>
                                </div>
                                
                            </div>
                            
                            <br>
                            <div class="col-xs-6 float-right">
                                <div class="row">
                                    <input type="button" onclick="cancelarOperacion()" class="btn btn-lg btn-outline-danger" value="Cancelar" />
                                    <button type="submit" class="btn btn-lg btn-outline-info">Guardar</button>
                                </div>
                            </div>
                        </div>
                    <!--/form:form-->
                    </form>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
        <script type="text/javascript">
            function cancelarOperacion(){
                document.location.replace("InicioBecario.htm");
            }
        </script>
    </body>
</html>
