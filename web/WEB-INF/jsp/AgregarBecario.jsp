<%@page contentType="text/html" pageEncoding="utf-8"%>
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
                    <form action="addBecario.htm" method="POST" >
                        <div class="form-group">
                            <h2>Datos del becario</h2>
                            <hr>
                            <h5> Información personal </h5> 
                            <h6 class="text-danger">* Campos rqueridos.</h6>
                            <hr>
                            <!--div class="form-group">
                                <label for="nombre">CURP</label>
                                <input type="text" class="form-control" id="txtPaternoBecario" name="paternoBecario" required>
                            </div-->
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i>
                                        <label class="col-xs-12" >Correo</label>
                                        <i class="text-danger">${errorCorreo}</i>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i><label class="col-xs-12">Contraseña</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" 
                                               type="email" 
                                               name="correo" 
                                               pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" 
                                               placeholder="correo@example.com"
                                               oninvalid="this.setCustomValidity('Ingresa una dirección de correo válida.')"
                                               oninput="this.setCustomValidity('')"
                                               value="${becario.getUsuario().getCorreo()}"
                                               required/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" 
                                               type="password" 
                                               name="password" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i>
                                        <label class="col-xs-12" >Nombre(s)</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i>
                                        <label class="col-xs-12">Primer apellido</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" 
                                               type="text" 
                                               name="nombreBecario" 
                                               pattern="[a-zA-Z ]{1,60}" 
                                               value="${becario.getNombreBecario()}"
                                               required/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" 
                                               type="text" 
                                               name="paternoBecario" 
                                               pattern="[a-zA-Z ]{1,60}" 
                                               value="${becario.getPaternoBecario()}"
                                               required/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i>
                                        <label class="col-xs-12">Segundo apellido</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i>
                                        <label class="col-xs-12">CURP</label>
                                        <i class="text-danger">${errorCURP}</i>
                                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text" 
                                               name="maternoBecario" 
                                               pattern="[a-zA-Z ]{1,60}" 
                                               value="${becario.getMaternoBecario()}"
                                               required/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6" >
                                        <input class="form-control" type="text" 
                                               pattern="^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$" 
                                               name="curp" 
                                               placeholder="Ej: XXXX123456XXXX12" 
                                               oninvalid="this.setCustomValidity('CURP invalido.')"
                                               oninput="this.setCustomValidity('')"
                                               value="${becario.getCurp()}"
                                               required/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i>
                                        <label class="col-xs-12">Edad</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Número de seguridad social</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" 
                                               type="number" min="15" max="26" 
                                               name="edad" 
                                               value="${becario.getEdad()}"
                                               required/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" 
                                               type="text" 
                                               name="numeroSeguridadSocial" 
                                               oninvalid="this.setCustomValidity('Número de seguridad social invalido.')"
                                               oninput="this.setCustomValidity('')"
                                               pattern="[0-9]{11}"
                                               value="${becario.getNumeroSeguridadSocial()}"
                                               placeholder="Ej: 12345678901"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i>
                                        <label class="col-xs-12">Teléfono</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Celular</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text" 
                                               name="telefono" 
                                               pattern="[0-9]{10}" 
                                               oninvalid="this.setCustomValidity('Ingresa un número telefónico válido.')"
                                               oninput="this.setCustomValidity('')"
                                               value="${becario.getTelefono()}"
                                               required/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text" 
                                               name="celular" 
                                               pattern="[0-9]{10}" 
                                               oninvalid="this.setCustomValidity('Ingresa un número telefónico válido.')"
                                               oninput="this.setCustomValidity('')"
                                               value="${becario.getCelular()}"
                                               />
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Cuentas con alguna discapacidad</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <select id="discapacidadSelect" name="idDiscapacidad">
                                            <option value="5">Ninguna</option>
                                            <option value="1">Auditiva</option>
                                            <option value="1">Visual</option>
                                            <option value="1">Habla</option>
                                            <option value="2">Motriz</option>
                                            <option value="3">Mental</option>
                                            <option value="4">Multiple</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!--div>
                                <br><br>
                                <h5> Información parental</h5>
                                <hr>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Nombre completo</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Parentesco</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Teléfono</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12">Otro (especifique)</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input class="form-control" type="text"/>
                                    </div>
                                </div>
                            </div-->
                            <div>
                                <br><br>
                                <h5> Información académica</h5>
                                <hr>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i><label class="col-xs-12">Grado de estudios  </label>
                                        <select id="gradoEstudiosSelect" name="idGradoEstudios">
                                            <option value="1">Primaria</option>
                                            <option value="2">Secundaria</option>
                                            <option value="3">Bachillerato</option>
                                            <option value="4">Carrera técnica</option>
                                            <option value="5">Licenciatura</option>
                                            <option value="6">Maestria</option>
                                            <option value="7">Doctorado</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <i class="text-danger">* </i><label class="col-xs-12">Cuentas con certificado de estudios o titulo </label>
                                        <select id="certificadoSelect" name="certificado">
                                            <option value="false">No</option>
                                            <option value="true">Sí</option>
                                        </select>
                                    </div>
                                </div>
                            </div><br>
                            <div class="col-xs-6 float-right">
                                <div class="row">
                                    <input type="button" onclick="cancelarOperacion()" class="btn btn-lg btn-outline-danger" value="Cancelar" />
                                    <button type="submit" class="btn btn-lg btn-outline-info">Siguiente</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#discapacidadSelect").val(${idDiscapacidad});
                $("#gradoEstudiosSelect").val(${idGradoEstudios});
                $("#certificadoSelect").val("${becario.isCertificado()}");
                
            });
            function cancelarOperacion(){
                document.location.replace("index.htm");
            }
        </script>
    </body>
</html>


