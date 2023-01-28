<%-- 
    Document   : ProductosABM
    Created on : 6 ene 2023, 12:34:17
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body onload="comprobar2(${estado})">
        <div class="row">
            <div class="col-sm-2">
                <div class="card-body">
                    <form action="Controlador?accion=ABMProducto" method="POST">
                        <div class="form-group container">
                            <label>Nombre</label>
                            <input type="text" value="${producto.getNombre()}" name="nombre" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Descripcion</label>
                            <input type="text" value="${producto.getDescripcion()}" name="descripcion" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Precio</label>
                            <input type="number" value="${producto.getPrecio()}" name="precio" min="0" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Stock</label>
                            <input type="number" value="${producto.getStock()}" name="stock" min="0" class="form-control">
                        </div>
                        <div class="form-group container">
                            <label>Estado</label>
                            <input type="text" value="${producto.getEstado()}"  name="estado" class="form-control">
                        </div>
                        <br>
                        <div class="row container">
                            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                <input type="submit" name="subaccion" value="Agregar" class="btn btn-outline-success">

                                <input type="submit" name="subaccion" value="Actualizar" class="btn btn-outline-secondary">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <br>
            <div class="col-sm-10">
                <table class="table ">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>DESCRIPCION</th>
                            <th>PRECIO</th>
                            <th>STOCK</th>
                            <th>ESTADO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="prod" items="${productos}">
                            <tr>
                                <td>${prod.getId()}</td>
                                <td>${prod.getNombre()}</td>
                                <td>${prod.getDescripcion()}</td>
                                <td>${prod.getPrecio()}</td>
                                <td>${prod.getStock()}</td>
                                <td>${prod.getEstado()}</td>
                                <td>
                                    <div class="row">
                                        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                            <a class="btn btn-outline-danger" href="Controlador?accion=ABMProducto&subaccion=Editar&id=${prod.getId()}">Editar</a>

                                            <a class="btn btn-outline-danger" onclick="confirmarBorrar2(${prod.getId()})">Eliminar</a>
                                        </div>
                                    </div> 
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- LIBRERIAS JS DE BOOTSTRAP -->
        <!--<script src="js/alertas4.js"></script>
        <script src="js/alertas6.js"></script>-->
        <script src="js/alerta.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    </body>
</html>
