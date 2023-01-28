/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.getElementById('cierre2').onclick = function (){
    document.getElementById('botoncierre').click();
};

document.getElementById('cierre3').onclick = function () {
    document.getElementById('botoncierre').click();
};

document.getElementById('cierre4').onclick = function () {
    document.getElementById('botoncierre').click();
};

document.getElementById("opciones").onclick = function (){
  document.getElementById("inicio").style="display: none;"; 
  document.getElementById("frame").style="height:650px;";
};


function mostrar(){
    var tipo = document.getElementById("clave");
    if(tipo.type === "password"){
        tipo.type="text";
    } else {
        tipo.type="password";
    }
}

function volveradm(){
    var usuario = document.getElementById("usuario").value;
    
    var url = "Controlador?accion=VolverAdministrador&usuario="+usuario;
    window.location.href = url;
}