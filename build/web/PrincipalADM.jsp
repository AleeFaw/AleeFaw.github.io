<%-- 
    Document   : PrincipalADM
    Created on : 30 dic 2022, 10:02:28
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administración</title>
        <!-- LIBRERIAS CSS DE BOOTSTRAP -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body style="background: url(imagenes/fondo.png); background-size: cover; background-repeat:repeat; background-position:center;">
        <!-- ACA COMIENZA LO AGREGADO DE BOOTSTRAP -->
        <br>
        <div class="row" id="inicio">
            <div class="col-12" align="center">
                <br><br><br><br><br><br><br><br><br>
                <img src="imagenes/logo editable.png" style="width: 300px; height: 300px;">
            </div>
        </div>
        <nav class="navbar navbar-dark bg-dark fixed-top" id="princi">
            <div class="container-fluid">
                <a class="navbar-brand"> <img src="imagenes/logo2.png" alt="10" width="40">Polka Games Store - Panel de administración.</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
                    <span id="opciones" class="navbar-toggler-icon"></span>
                </button>
                <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Panel de administracion</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close" id="botoncierre"></button>
                    </div>
                    <div class="row" align="center">
                        <a> <img src="imagenes/logoousuario.png" alt="60" width="100"> </a>
                    </div>
                    <div class="row">
                        <div class="col-3"></div>
                        <div class="col-6" align="center">
                            <label>Bienvenido administrador: </label> ${nombre.getNombre()} ${apellido.getApellido()}
                        </div>
                        <div class="col-3"></div>

                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                            <li class="nav-item">
                                <a class="nav-link" href="Controlador?accion=ABMUsuario&subaccion=Listar" id="cierre2" target="myFrame">Administración de usuarios</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Controlador?accion=ABMProducto&subaccion=Listar" id="cierre3" target="myFrame">Administración de productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Controlador?accion=ListarVentas" id="cierre4" target="myFrame">Administración de ventas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Controlador?accion=Salir">Cerrar sesión</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- -->
        <br><br><br><br>
        <div class="m-4" id="frame" style="height: 0px; border-bottom-color: red;"> 
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none;"></iframe>
        </div>
        
        <footer style="position: fixed; bottom: 0px; vertical-align: bottom;">
            <div class="row">
                <div class="col-12 bg-dark" style="width: 1300px;">
                    <div class="row">
                        <div class="col-6" align="left" style="vertical-align: bottom;" >
                            <label style="color: white; padding: 12px;">© 2023 Polka Games Corporation. Todos los derechos reservados.</label>
                        </div>
                        <div class="col-6" align="right">
                            <img src="imagenes/logo_unlz.png" alt="140" width="180"/>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- LIBRERIAS JS DE BOOTSTRAP -->
        <!--<script src="js/funciones1.js"></script>-->
        <script src="js/funcion.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        
    </body>
</html>
