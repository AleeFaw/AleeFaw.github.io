<%-- 
    Document   : CambiarDatos
    Created on : 28 dic 2022, 17:22:36
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar Datos Personales</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body style="background: url(imagenes/fondo.png); background-size: cover; background-repeat:repeat; background-position:center;"onload="comprobar4(${estado})">
        <br>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="card-body" style="background: white">
                    <!--<form action="Controlador?accion=ABMUsu" method="POST">-->
                        <br>
                        <div style="text-align: center">
                            <label>EDITAR DATOS PERSONALES</label>
                        </div>
                        <div class="container" style="height: 2px; width: 80%; background-color: rgba(132, 151, 176, 0.5);"></div> <br>

                        <div class="form-group container">
                            <label>Dni</label>
                            <input id="dni" type="text" value="${cliente.getDni()}" name="dni" class="form-control" readonly="true">
                        </div>
                        <div class="form-group container">
                            <label>Nombre</label>
                            <input id="nombre" type="text" value="${cliente.getNombre()}"name="nombre" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Apellido</label>
                            <input id="apellido" type="text" value="${cliente.getApellido()}" name="apellido" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Direccion</label>
                            <input id="direccion" type="text" value="${cliente.getDireccion()}" name="direccion" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Estado</label>
                            <input id="estado" type="text" value="${cliente.getEstado()}" readonly onmousedown="return false;" name="estado" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Usuario</label>
                            <input id="usuario" type="text" value="${cliente.getUsuario()}" readonly onmousedown="return false;" name="usuario" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Clave</label>
                            <input id="clave" type="text" value="${cliente.getClave()}" name="clave" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Saldo</label>
                            <input id="saldo" type="number" value="${cliente.getSaldo()}" name="saldo" readonly onmousedown="return false;" class="form-control">
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-5" align="center" >
                                <a type="submit" class="btn btn-outline-danger" href="Controlador?accion=Compra&subaccion=Listar">regresar</a>
                            </div>
                            <div class="col-7" align="center" >
                                <input type="submit" value="Modificar datos" id="modif" class="btn btn-outline-success">
                            </div>
                        </div>
                        <br>
                   <!--</form>-->
                </div>
            </div>
            <div class="col-3"></div>

        </div>
        <!--<script src="js/alertas.js"></script>-->
        <script src="js/alerta.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>

    </body>
</html>
