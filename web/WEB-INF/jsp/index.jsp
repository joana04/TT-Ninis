<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <%@ include file="shared/header.jsp" %>
        <link rel="stylesheet" href="assets/css/signin.css">
    </head>
    <body >
        <div class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
            <div class="container">
                <a href="https://www.ipn.mx" class="navbar-brand">IPN</a>
            </div>
        </div>
        <div class="container">
            <div class="row text-center">
                <div class="col-12 ">
                    <div class="center-auto">
                        <div class="form-signin">
                            <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                            <img class="mb-4" src="assets/img/ipn-logo.jpg" alt="" width="72" height="90">
                            
                            <h1 class="h3 mb-3 font-weight-normal">Inicia Sesión</h1>
                            <p class="text-danger"> ${errorContra} ${errorUser} </p>
                            <hr>
                            <div class="form-group">
                                <form action="Inicio.htm" method="POST" > 
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="user" name="correo" placeholder="Correo electronico" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="descripcion" name="contrasena" placeholder="Contraseña" required>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-lg btn-outline-info btn-block">Iniciar</button>
                                    </div>
                                </form>
                            </div>
                            <hr>
                            <div class="text-right"><a  href="#" class="text-info" >Recuperar contraseña</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="animated fadeIn delay-10ms">
                <div class="row col-md-12">
                    <div class="col-md-4">
                        <div class="card border-info mb-3" style="max-width: 30rem;">
                            <div class="card-header"> </div>
                            <div class="card-body">
                              <h4 class="card-title">Becarios</h4>
                              <p class="card-text">Registra tu información.</p>
                              <a href="AgregarBecario.htm" class="btn btn-lg btn-outline-info btn-block">Registrar</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-warning mb-3" style="max-width: 30rem; display: none;">
                            <div class="card-header"></div>
                            <div class="card-body">
                              <h4 class="card-title">Vacantes</h4>
                              <p class="card-text">Vacantes registradas por las empresas.</p>
                              <a href="AgregarBecario.htm" class="btn btn-lg btn-outline-warning btn-block">Registrar</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-info mb-3" style="max-width: 30rem;">
                            <div class="card-header"></div>
                            <div class="card-body">
                              <h4 class="card-title">Empresas</h4>
                              <p class="card-text">Registra la información de tu empresa.</p>
                              <a href="MostrarEmpresas.htm" class="btn btn-lg btn-outline-info btn-block">Registrar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <%@ include file="shared/footer.jsp" %>
        </div>
        
    </body>
</html>
