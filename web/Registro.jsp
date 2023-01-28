<%-- 
    Document   : Registro
    Created on : 26 ene 2023, 13:22:36
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body style="background: url(imagenes/fondo.png); background-size: cover; background-repeat:repeat;" onload="resultado(${estado})">
        <nav class="navbar navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand"> <img src="imagenes/logo2.png" alt="10" width="40">Polka Games Store - Tu sitio favorito de videojuegos!</a>

            </div>
        </nav>
        <br><br><br><br><br><br><br><br><br>
        <div class="row" >
            <div class="col-1"></div>
            <div class="col-10">
                <form class="form-sign" action="Controlador?accion=Registrar" method="POST">
                    <div class="card">
                        <div class="card-body">
                            <div class="table container">
                                <div class="row">
                                    <div class="col">
                                        <label class="col col-form-label">Nombre:</label>

                                        <input class="form-control" id="nombre" name="nombre" type="text" href="#">
                                    </div>
                                    <div class="col">
                                        <label class="col-sm-2 col-form-label" >Apellido:</label>

                                        <input class="form-control" id="apellido" name="apellido" type="text" href="#">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label class="col-sm-2 col-form-label" >Dni:</label>

                                        <input class="form-control" id="dni" name="dni" type="number" href="#">
                                    </div>
                                    <div class="col">
                                        <label class="col-form-label" >Direccion:</label>

                                        <input class="form-control" id="direccion" name="direccion" type="text" href="#">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label class="col-sm-2 col-form-label" >Usuario:</label>

                                        <input class="form-control" id="usuario" name="usuario" type="text" href="#">
                                    </div>
                                    <div class="col">
                                        <label class="col-sm-2 col-form-label" >Clave:</label>

                                        <input class="form-control" id="clave" name="clave" type="text" href="#">
                                    </div>
                                </div>
                                <br>
                                <div align="center">
                                    <button type="submit" class="btn btn-success">Registrarse</button>
                                    <a class="btn btn-primary" type="submit" href="index.jsp">Regresar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-1"></div>
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
        <!--<script src="js/alertas3.js"></script>-->
        <script src="js/alerta.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    </body>
</html>
