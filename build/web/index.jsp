<%-- 
    Document   : index
    Created on : 28 dic 2022, 0:49:02
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Polka Games Store</title>
        <!-- LIBRERIAS CSS DE BOOTSTRAP -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body style="background: url(imagenes/backindex.png); background-size: cover; background-repeat:no-repeat; background-position:center;" onload="comprobar6(${estado})">
        <div class="container mt-4 col-lg-4">
            <br> <br> <br> <br>
            <div class="card col-sm-10" style="background-color: rgb(0, 0, 0, 0.5);">
                <div class="card-body">
                    <br> <br> 
                    <form class="form-sign" action="Validacion" method="POST">
                        <div class="form-group text-center">
                            <img src="imagenes/logo editable.png" alt="120" width="220"/>
                            <label style="color: white">Tu sitio de videojuegos favorito!</label>
                        </div>
                        <br>
                        <div class="form-group">
                            <label style="color: white">Usuario:</label>
                            <input type="text" name="usuario" class="form-control">
                        </div>
                        <div class="row">
                            <div class="col-10">
                                <div class="form-group">
                                    <label style="color: white">Clave:</label>
                                    <input type="password" name="clave" id="clave" class="form-control">
                                </div>
                            </div>
                            <div class="col-2" style="margin-top: 8px;">
                                <br>
                                <a onclick="mostrar()" style="cursor: pointer;">👁</a>
                            </div>
                        </div>

                        <br>
                        <div class="row">
                            <div class="col-6" align="center">
                                <input type="submit" name="accion" value="ingresar" class="btn btn-primary btn-block">
                            </div>
                            <div class="col-6" align="center">
                                <a href="Controlador?accion=irregistro&estado=3" class="btn btn-primary btn-block">Registrarse</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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
        <!--<script src="js/funciones4.js"> </script>-->
        <script src="js/funcion.js"></script>
        <script src="js/alerta.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    </body>
</html>
