<%-- 
    Document   : Inicio
    Created on : 28 dic 2022, 17:24:06
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <!-- LIBRERIAS CSS DE BOOTSTRAP -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body style="background: url(imagenes/fondo.png); background-size: cover; background-repeat:repeat; background-position:center;" onload="comprobar5(${estado})">
        <br>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="row" style="background: white;">
                    <div class="col-sm-1"> </div>
                    <div class="col-sm-10">
                        <table class="table ">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>NOMBRE</th>
                                    <th>PRECIO</th>
                                    <th>CANTIDAD</th>
                                    <th>STOCK</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="pro" items="${productos}">
                                    <tr>
                                        <td>${pro.getId()}</td>
                                        <td>${pro.getNombre()}</td>
                                        <td>${pro.getPrecio()}</td>
                                        <td><input type="number" value="1" name="canti" id="canti${pro.getId()}" min="1" max="${pro.getStock()}"></td>
                                        <td>${pro.getStock()}</td>
                                        <td>
                                            <div class="row">
                                                <div class="col-12">
                                                    <a class="btn btn-outline-danger" onclick="addToCart(${pro.getId()}, '${pro.getNombre()}', ${pro.getPrecio()}, ${pro.getStock()})">Agregar al carrito</a> 
                                                </div>
                                            </div> 
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <div class="col-sm-1">
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

        
        
        <script> function addToCart(id, nombre, precio, stock) { var cantidad = document.getElementById("canti"+id).value; var url = "Controlador?accion=AgregarItem&id=" + id + "&nom=" + nombre + "&pre=" + precio + "&canti=" + cantidad + "&stock=" + stock; window.location.href = url; } </script>
        <!-- LIBRERIAS JS DE BOOTSTRAP -->
        <script src="js/alerta.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    </body>
</html>
