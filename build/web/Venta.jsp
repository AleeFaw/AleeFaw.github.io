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
        <title>Lista de ventas</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>

        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <br> <br>
                <div class="card">
                    <div class="card-body">
                       Cantidad de ventas <input type="text" name="" readonly="true" value="${cantidad}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>VENTA N°</th>
                                    <th>CLIENTE</th>
                                    <th>NUMERO SERIE</th>
                                    <th>FECHA</th>
                                    <th>PRECIO</th>
                                    <th>ESTADO</th>
                                    <th id="celdaaccion">ACCIONES</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="lista2" items="${lista2}">
                                    <tr>
                                        <td>${lista2.getId()}</td>
                                        <td>${lista2.getIdC()}</td>
                                        <td>${lista2.getnSerie()}</td>
                                        <td>${lista2.getFecha()}</td>
                                        <td>${lista2.getMonto()}</td>
                                        <td>${lista2.getEstado()}</td>
                                        <td id="botonaccion">
                                            <a href="Controlador?accion=VerDetalle&idv=${lista2.getId()}" class="btn btn-primary">Ver detalle</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

        <!-- LIBRERIAS JS DE BOOTSTRAP -->
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        
    </body>
</html>
