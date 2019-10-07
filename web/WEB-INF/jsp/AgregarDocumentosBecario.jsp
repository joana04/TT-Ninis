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
                    <form action="savefileBecario.htm" method="post" enctype="multipart/form-data">  
                        <div class="form-group">
                            <h2>Datos del becario ${becario.getNombreBecario()}</h2>
                            <!--input name="curp" value="${becario.getCurp()}" style="display: none;"/-->
                            <hr>
                            <h5> Archivos </h5>
                            <hr>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12" >CURP</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input type="file" name="file" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12" >Comprobante de domicilio</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input type="file" name="domicilio" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12" >Comprobante de estudios</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input type="file" name="estudios" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-xs-12" >Acta de nacimiento</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <input type="file" name="acta" required/>
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
