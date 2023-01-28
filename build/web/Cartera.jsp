<%-- 
    Document   : Cartera
    Created on : 28 dic 2022, 17:23:00
    Author     : Ale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monedero</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    </head>
    <body style="background: url(imagenes/fondo.png); background-size: cover; background-repeat:repeat;" onload="comprobar3(${estado})">

        <div class="row" style="margin-top: 10px">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-3"></div>
                            <div class="col-6" align="center">
                                <img src="imagenes/billetera.png" style="width: 280px; height: 250px;">
                            </div>
                            <div class="col-3"></div>
                        </div>
                        <br><br>
                        <div class="row">
                            <div class="col-5" align="right">

                            </div>
                            <div class="col-2">
                                <div class="card" align="center">
                                    Saldo disponible: <a value="$550" readonly="true">$${saldo}</a>
                                </div>
                            </div>
                            <div class="col-5"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-1" align="right">

                            </div>
                            <div class="col-5">
                                <div class="card" align="center">
                                    Usuario destino: <input type="text" id="destino" class="card">
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="card" align="center">
                                    Cantidad: <input type="number" id="cantidad" class="card" min="1" max="${saldo}">
                                </div>
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-4" align="center">
                                <a class="btn btn-success" id="depositar" onclick="Deposito()">Depositar dinero</a>
                            </div>
                            <div class="col-4" align="center">
                                <a class="btn btn-success" id="extraer" onclick="Extraer()">Retirar dinero</a>
                            </div>
                            <div class="col-4" align="center">
                                <a class="btn btn-success" id="transferir" onclick="Transferir()">Transferir dinero</a>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card-footer" align="center">
                        
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

        <script> function Deposito() {
                var cant = document.getElementById("cantidad").value;
                var url = "Controlador?accion=Depositar&id=${id}&saldo=" + cant;
                window.location.href = url;
            }</script>
        <script> function Extraer() {
                var cant = document.getElementById("cantidad").value;
                var url = "Controlador?accion=Extraer&id=${id}&saldo=" + cant;
                window.location.href = url;
            }</script>
        <script>
            function Transferir() {
                var cant = document.getElementById("cantidad").value;
                var destino = document.getElementById("destino").value;
                var url = "Controlador?accion=Transferir&id=${id}&saldo=" + cant + "&destino=" + destino;
                window.location.href = url;
            }
        </script>
        <!-- LIBRERIAS JS DE BOOTSTRAP -->
        <!--<script src="js/alertas5.js"></script>-->
        <script src="js/alerta.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

    </body>
</html>
