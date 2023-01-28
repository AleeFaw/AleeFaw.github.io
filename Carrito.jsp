<%-- 
    Document   : Carrito
    Created on : 28 dic 2022, 17:22:22
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito de compras</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body style="background: url(imagenes/fondo.png); background-size: cover; background-repeat:repeat;" onload="comprobar(${estado})">
        <br>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="card">
                    <div class="card-body">
                        Nº Ticket: <input type="text" name="nticket" readonly="true" value="${nserie}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>NUMERO</th>
                                    <th>CODIGO</th>
                                    <th>NOMBRE</th>
                                    <th>PRECIO</th>
                                    <th>CANTIDAD</th>
                                    <th>SUBTOTAL</th>
                                    <th id="celdaaccion">ACCIONES</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="lista" items="${lista}">
                                    <tr>
                                        <td>${lista.getItem()}</td>
                                        <td>${lista.getIdP()}</td>
                                        <td>${lista.getNomPro()}</td>
                                        <td>${lista.getPrecio()}</td>
                                        <td>${lista.getCant()}</td>
                                        <td>${lista.getSubtotal()}</td>
                                        <td id="botonaccion">
                                            <a href="Controlador?accion=BorrarCarrito&idp=${lista.getIdP()}" class="btn btn-primary">Borrar</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer" align="center">
                        <div class="row">
                            <div class="col-8 botones">
                                <input type="submit" onclick="comprar(${id})" class="btn btn-success"value="Confirmar compra">
                                <a class="btn btn-primary" id="seguir" href="Controlador?accion=Compra&subaccion=Listar">Continuar comprando</a>
                            </div>
                            <div class="col-4">
                                Total: <input type="text" value="$${total}" name="preTotal" style="border-radius: 6px; padding: 6px" readonly="on">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

        <!-- LIBRERIAS JS DE BOOTSTRAP -->
        <!--<script src="js/alertas2.js"></script>-->
        <script src="js/alerta.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        
    </body>
</html>
