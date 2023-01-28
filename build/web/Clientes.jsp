<%-- 
    Document   : Clientes
    Created on : 30 dic 2022, 9:38:44
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administración de usuarios</title>
        <!-- LIBRERIAS CSS DE BOOTSTRAP -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body onload="comprobar2(${estado})">
        <br>
        <div class="row">
            <div class="col-sm-2">
                <div class="card-body">
                    <form action="Controlador?accion=ABMUsuario" method="POST">
                        <div class="form-group container">
                            <label>Dni</label>
                            <input type="number" value="${cliente.getDni()}" name="dni" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Nombre</label>
                            <input type="text" value="${cliente.getNombre()}"name="nombre" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Apellido</label>
                            <input type="text" value="${cliente.getApellido()}" name="apellido" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Direccion</label>
                            <input type="text" value="${cliente.getDireccion()}" name="direccion" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Estado</label>
                            <input type="text" value="${cliente.getEstado()}" name="estado" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Usuario</label>
                            <input type="text" id="usuario" value="${cliente.getUsuario()}" name="usuario" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Clave</label>
                            <input type="text" value="${cliente.getClave()}" name="clave" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Saldo</label>
                            <input type="number" value="${cliente.getSaldo()}" name="saldo" class="form-control">
                        </div>
                        <br>
                        <div class="row container">
                            <div class="btn-group" role="group" aria-label="Basic mixed styles example" >

                                <input type="submit" name="subaccion" value="Agregar" class="btn btn-outline-success">

                                <input type="submit" name="subaccion" id="Actualizar" value="Actualizar" class="btn btn-outline-secondary">
                            </div>
                            <br>
                            <div class="col-12" align="center" >
                                <a id="admin" onclick="volveradm()" class="btn btn-outline-success" style="width: 175px; margin-top:10px;">Hacer administrador</a>
                            </div>  
                        </div>


                    </form>
                </div>
            </div>
            <br>
            <div class="col-sm-10">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DNI</th>
                            <th>NOMBRE</th>
                            <th>APELLIDO</th>
                            <th>DIRECCION</th>
                            <th>ESTADO</th>
                            <th>USUARIO</th>
                            <th>CLAVE</th>
                            <th>SALDO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cli" items="${clientes}">
                            <tr>
                                <td>${cli.getId()}</td>
                                <td>${cli.getDni()}</td>
                                <td>${cli.getNombre()}</td>
                                <td>${cli.getApellido()}</td>
                                <td>${cli.getDireccion()}</td>
                                <td>${cli.getEstado()}</td>
                                <td>${cli.getUsuario()}</td>
                                <td>${cli.getClave()}</td>
                                <td>${cli.getSaldo()}</td>
                                <td>
                                    <div class="row">
                                        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                            <a class="btn btn-outline-danger" href="Controlador?accion=ABMUsuario&subaccion=Editar&id=${cli.getId()}">Editar</a>

                                            <a class="btn btn-outline-danger" onclick="confirmarBorrar(${cli.getId()})">Eliminar</a>
                                        </div>
                                    </div> 
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>


        <script>document.getElementById(Actualizar).onclick = function () {
                alert(${mensaje});
            };</script>
        <!-- LIBRERIAS JS DE BOOTSTRAP -->
        <!--<script src="js/alertas4.js"> </script>
        <script src="js/alertas6.js"></script>-->
        <script src="js/alerta.js"></script>
        <script src="js/funcion.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    </body>
</html>
