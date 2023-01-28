/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function modificar() {
    var dni = document.getElementById("dni").value;
    var nombre = document.getElementById("nombre").value;
    var apellido = document.getElementById("apellido").value;
    var direccion = document.getElementById("direccion").value;
    var estado = document.getElementById("estado").value;
    var usuario = document.getElementById("usuario").value;
    var clave = document.getElementById("clave").value;
    var saldo = document.getElementById("saldo").value;

    var url = "Controlador?accion=ABMUsu&subaccion=Modificar&dni=" + dni + "&nombre=" + nombre + "&apellido=" + apellido + "&direccion=" + direccion + "&estado=" + estado + "&usuario=" + usuario + "&clave=" + clave + "&saldo=" + saldo;
    window.location.href = url;
}

document.getElementById("modif").onclick = function () {
    swal({
        title: "¿Esta seguro de modificar sus datos?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((modificado) => {
        if (modificado) {
            
            setTimeout(() => { modificar(); },1000);
        } else {
            swal("No se han modificado sus datos");
        }
    });
    
};

function comprobar(id){
    if(id===1){
        print();
        swal("Su compra se realizo con exito.", "", "success");
        setTimeout(() => { 
            var url = "Controlador?accion=BorrarTodoCarrito";
            window.location.href = url;
        },6000);
    } else if (id===2){
        swal("Su dinero no es suficiente")
    } else if (id===3){
        swal("El carrito esta vacio.");
    }
}

function compra(id) {
    //print();
    var url = "Controlador?accion=NuevaVenta&id="+id;
    window.location.href = url;
}

function comprar(id){
     swal({
        title: "¿Esta seguro de realizar la compra?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((comprado) => {
        if (comprado) {
            compra(id);
        } else {
            swal("No se ha realizado la compra");
        }
    });
}

function resultado(valor){
    if(valor===0){
        swal("El nombre de usuario no se encuentra disponible");
    }else if(valor===1){
        swal("El registro fue exitoso", "", "success");
        setTimeout(() => { redirigir(); },2500);
    }else if(valor===2){
        swal("No pueden quedar espacios vacios.");
    }
}

function redirigir() {
    var url = "index.jsp";
    window.location.href = url;
}

//ACA VAMOS A PEGAR ALERTA 4 HAY QUE MODIFICAR POR COMPROBAR2
function comprobar2(valor){
    if(valor===1){
        swal("No se pueden dejar campos vacios.");
    }else if(valor===2){
        swal("El nombre de usuario no esta disponible.");
    }else if(valor===3){
        swal("Usuario agregado correctamente.", "", "success");
    } else if(valor===4){
        swal("El producto se agrego correctamente.", "", "success");
    } else if(valor===5){
        swal("El usuario se edito correctamente.", "", "success");
    } else if(valor===6){
        swal("El producto se edito correctamente.", "", "success");
    } else if(valor===7){
        swal("El producto se elimino correctamente.", "", "success");
    }else if(valor===8){
        swal("Como minimo debe indicar el nombre de usuario.");
    } else if(valor===9){
        swal("No se reconoce como cliente activo a quien desea volver administrador");
    } else if(valor===10){
        swal("El usuario se ha vuelto administrador","","success");
    }
}

//ACA VAMOS A PEGAR ALERTA 5 HAY QUE MODIFICAR POR COMPROBAR3
function comprobar3(valor){
    if(valor===1){
        swal("El dinero se deposito con exito.", "", "success");
    }else if(valor===2){
        swal("El dinero se extrajo con exito.", "", "success");
        
    }else if(valor===3){
        swal("El saldo disponible no es suficiente para su extracción.");
    } else if(valor===4){
        swal("El saldo disponible no es suficiente para su transferencia.");
    } else if(valor===5){
        swal("El usuario indicado no existe.");
    } else if(valor===6){
        swal("La transferencia se realizo con exito.", "", "success");
    } else if(valor===7){
        swal("No puede indicar cantidades negativas.");
    } else if(valor===8){
        swal("No puede dejar espacios en blanco");
    }
}

//ACA PEGAMOS ALERTA6 HAY QUE MODIFICAR REDIRIGIR Y REDIRIGIR2 POR REDIRIGIR3
function redirigir3(id) {
    var url = "Controlador?accion=ABMUsuario&subaccion=Borrar&id="+id;
    window.location.href = url;
}

function confirmarBorrar(id){
     swal({
        title: "¿Esta seguro que desea borrar los datos del usuario?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((comprado) => {
        if (comprado) {
            swal("El usuario fue eliminado", {
                icon: "success"
            });
            setTimeout(() => { redirigir3(id); },2500);
        } else {
            swal("No se ha borrado el dato del usuario");
        }
    });
}

function redirigir2(id) {
    var url = "Controlador?accion=ABMProducto&subaccion=Borrar&id="+id;
    window.location.href = url;
}

function confirmarBorrar2(id){
     swal({
        title: "¿Esta seguro que desea borrar los datos del producto?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((comprado) => {
        if (comprado) {
            swal("El producto fue eliminado.", {
                icon: "success"
            });
            setTimeout(() => { redirigir2(id); },1500);
        } else {
            swal("No se ha borrado el producto.");
        }
    });
}

function comprobar4(valor){
    if(valor===1){
        swal("Sus datos fueron modificados con exito.", "", "success");
    }else if(valor===2){
        swal("No puede contener espacios vacios.");
        
    }
}

function comprobar5(valor){
    if(valor===1){
        swal("No puede agregar cantidades negativas.");
    }else if(valor===2){
        swal("Producto agregado al carrito.", "", "success");   
    }else if(valor===3){
        swal("Cantidad modificada con exito.", "", "success");   
    }else if(valor===4){
        swal("La cantidad que desea agregar supera el stock.");
    }else if(valor===5){
        swal("No puede dejar la cantidad vacia.");
    }
}

function comprobar6(valor){
    if(valor===1){
        swal("Usuario y/o contraseña incorrecto.","","warning");
    }
}



