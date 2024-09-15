<%-- 
    Document   : VerInfoBecario
    Created on : 30/09/2019, 09:37:36 PM
    Author     : lm107
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar empresa</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body >        
    <!--%@ include file="shared/navbarBecario.jsp" %-->
        
        <div class="container">
            <div class="row">
                <div class="col-10 center-auto">
                    <!--h2>Datos del becario</h2-->
                    <hr>
                    <h5> Documentos del becario </h5> 
                    <hr>
                    <div class="row">
                        <label class="col-xs-12"><a href="MostrarArchivo.htm?id=${becario.getCurp()}&file=curp" target="_blank">CURP</a></label>
                    </div>
                    <div class="row">
                        <label class="col-xs-12"><a href="MostrarArchivo.htm?id=${becario.getCurp()}&file=domicilio" target="_blank">Comprobante de domicilio</a></label>
                    </div>
                    <div class="row">
                        <label class="col-xs-12"><a href="MostrarArchivo.htm?id=${becario.getCurp()}&file=estudios" target="_blank">Comprobante de estudios</a></label>
                    </div>
                    <div class="row">
                        <label class="col-xs-12"><a href="MostrarArchivo.htm?id=${becario.getCurp()}&file=acta" target="_blank">Acta de nacimiento</a></label>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <!--%@ include file="shared/footer.jsp" %-->
    </body>
</html>

