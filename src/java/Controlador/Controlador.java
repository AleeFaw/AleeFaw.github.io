/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Conexiones.GenerarSerie;
import Modelo.AdminDAO;
import Modelo.Cliente;
import Modelo.ClienteDAO;
import Modelo.Detalle;
import Modelo.DetalleDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Venta;
import Modelo.VentaDAO;
import com.sun.java.swing.plaf.windows.resources.windows;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ale
 */
public class Controlador extends HttpServlet {

    Cliente cli = new Cliente();
    Producto pro = new Producto();
    AdminDAO adao = new AdminDAO();
    ClienteDAO cdao = new ClienteDAO();
    ProductoDAO pdao = new ProductoDAO();
    Detalle det = new Detalle();
    DetalleDAO ddao = new DetalleDAO();
    int idc, idp;
    Venta vent = new Venta();
    List<Venta> lista3 = new ArrayList<>();
    int item;
    int codI;
    String descripcion3;
    double precio3;
    int cant3;
    double subtotal3;
    double total;
    String numeroserie;
    int idCLIEN;
    VentaDAO vdao = new VentaDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        String subaccion = request.getParameter("subaccion");

        switch (accion) {
            case "Principal":
                request.getRequestDispatcher("Principal.jsp").forward(request, response);
                break;
            case "PrincipalADM":
                request.getRequestDispatcher("PrincipalADM.jsp").forward(request, response);
                break;
            case "CambiarDatos":
                request.getRequestDispatcher("CambiarDatos.jsp").forward(request, response);
                break;
            case "Carrito":
                request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                break;
            case "Cartera":
                //double sal = Double.parseDouble(request.getParameter("saldo"));

                idCLIEN = Integer.parseInt(request.getParameter("id"));
                Cliente client = new Cliente();
                client = cdao.verSaldo(idCLIEN);
                double sal = client.getSaldo();
                request.setAttribute("saldo", sal);
                request.setAttribute("id", idCLIEN);
                request.getRequestDispatcher("Cartera.jsp").forward(request, response);
                break;
            case "Inicio":
                request.getRequestDispatcher("Inicio.jsp").forward(request, response);
                break;
            case "Depositar":
                idCLIEN = Integer.parseInt(request.getParameter("id"));
                String sal2 = request.getParameter("saldo");
                Cliente c2 = new Cliente();
                c2 = cdao.buscar(idCLIEN);
                if (!sal2.isEmpty()) {
                    Double sal3 = Double.valueOf(sal2);
                    if (sal3 >= 0) {
                        sal3 = c2.getSaldo() + sal3;
                        cdao.actualizarSaldo(idCLIEN, sal3);
                        request.setAttribute("estado", 1);
                    } else {
                        request.setAttribute("estado", 7);
                    }
                } else {
                    request.setAttribute("estado", 8);
                }

                request.getRequestDispatcher("Controlador?accion=Cartera").forward(request, response);
                break;
            case "Extraer":
                idCLIEN = Integer.parseInt(request.getParameter("id"));
                String sal3 = request.getParameter("saldo");
                Cliente c3 = new Cliente();
                c3 = cdao.buscar(idCLIEN);
                if (!sal3.isEmpty()) {
                    double sal4 = Double.parseDouble(sal3);
                    if (sal4 >= 0) {
                        if (c3.getSaldo() >= sal4) {
                            sal4 = c3.getSaldo() - sal4;
                            request.setAttribute("estado", 2);
                            cdao.actualizarSaldo(idCLIEN, sal4);
                        } else {
                            request.setAttribute("estado", 3);
                        }
                    } else {
                        request.setAttribute("estado", 7);
                    }
                } else {
                    request.setAttribute("estado", 8);
                }

                request.getRequestDispatcher("Controlador?accion=Cartera").forward(request, response);
                break;
            case "Transferir":
                idCLIEN = Integer.parseInt(request.getParameter("id"));
                String destino = request.getParameter("destino");
                String sal4 = request.getParameter("saldo");

                Cliente c4 = new Cliente();
                Cliente c5 = new Cliente();

                c4 = cdao.buscar(idCLIEN);

                c5 = cdao.buscarPorUsuario(destino);
                if (!sal4.isEmpty()) {
                    Double sal6 = Double.valueOf(sal4);
                    if (sal6 >= 0) {
                        if (c4.getSaldo() >= sal6) {
                            if (c5.getUsuario() != null) {
                                double sal5 = c5.getSaldo() + sal6;
                                cdao.actualizarSaldo(c5.getId(), sal5);
                                sal6 = c4.getSaldo() - sal6;
                                cdao.actualizarSaldo(idCLIEN, sal6);
                                request.setAttribute("estado", 6);
                            } else {
                                request.setAttribute("estado", 5);
                            }
                        } else {
                            request.setAttribute("estado", 4);
                        }
                    } else {
                        request.setAttribute("estado", 7);
                    }
                } else {
                    request.setAttribute("estado", 8);
                }

                request.getRequestDispatcher("Controlador?accion=Cartera").forward(request, response);
                break;
            case "Registrar":
                String dni3 = request.getParameter("dni");
                String nombre3 = request.getParameter("nombre");
                String apellido3 = request.getParameter("apellido");
                String direccion3 = request.getParameter("direccion");
                String usuario3 = request.getParameter("usuario");
                String clave3 = request.getParameter("clave");

                if (dni3.isEmpty() || nombre3.isEmpty() || apellido3.isEmpty() || direccion3.isEmpty() || usuario3.isEmpty() || clave3.isEmpty()) {
                    request.setAttribute("estado", 2);
                } else {
                    if (cdao.comprobarUsuario(usuario3) == true) {
                        cli.setDni(dni3);
                        cli.setNombre(nombre3);
                        cli.setApellido(apellido3);
                        cli.setDireccion(direccion3);
                        cli.setUsuario(usuario3);
                        cli.setClave(clave3);
                        cli.setEstado("1");
                        adao.agregar(cli);
                        request.setAttribute("estado", 1);
                    } else {
                        request.setAttribute("estado", 0);
                    }
                }
                request.getRequestDispatcher("Registro.jsp").forward(request, response);
                break;
            case "irregistro":
                int estados = Integer.parseInt(request.getParameter("estado"));
                request.setAttribute("estado", estados);
                request.getRequestDispatcher("Registro.jsp").forward(request, response);
                break;
            case "ABMUsuario":
                switch (subaccion) {
                    case "Listar":
                        List lista = adao.listar();
                        request.setAttribute("clientes", lista);
                        break;
                    case "Agregar":
                        String dni = request.getParameter("dni");
                        String nombre = request.getParameter("nombre");
                        String apellido = request.getParameter("apellido");
                        String direccion = request.getParameter("direccion");
                        String estado = request.getParameter("estado");
                        String usuario = request.getParameter("usuario");
                        String clave = request.getParameter("clave");
                        String saldo = request.getParameter("saldo");
                        if ((dni.isEmpty()) || (nombre.isEmpty()) || (apellido.isEmpty()) || (direccion.isEmpty()) || (estado.isEmpty()) || (usuario.isEmpty()) || (clave.isEmpty()) || (saldo.isEmpty())) {
                            request.setAttribute("estado", 1);
                        } else {
                            if (cdao.comprobarUsuario(usuario) == true) {
                                cli.setDni(dni);
                                cli.setNombre(nombre);
                                cli.setApellido(apellido);
                                cli.setDireccion(direccion);
                                cli.setEstado(estado);
                                cli.setUsuario(usuario);
                                cli.setClave(clave);
                                cli.setSaldo(Double.valueOf(saldo));
                                adao.agregar(cli);
                                request.setAttribute("estado", 3);
                            } else {
                                request.setAttribute("estado", 2);
                            }
                        }
                        request.getRequestDispatcher("Controlador?accion=ABMUsuario&subaccion=Listar").forward(request, response);
                        break;

                    case "Editar":
                        idc = Integer.parseInt(request.getParameter("id"));
                        Cliente clie = adao.listarId(idc);
                        request.setAttribute("cliente", clie);
                        request.getRequestDispatcher("Controlador?accion=ABMUsuario&subaccion=Listar").forward(request, response);

                        break;

                    case "Borrar":
                        idc = Integer.parseInt(request.getParameter("id"));
                        adao.borrar(idc);
                        request.getRequestDispatcher("Controlador?accion=ABMUsuario&subaccion=Listar").forward(request, response);
                        break;
                    case "Actualizar":
                        String dni2 = request.getParameter("dni");
                        String nombre2 = request.getParameter("nombre");
                        String apellido2 = request.getParameter("apellido");
                        String direccion2 = request.getParameter("direccion");
                        String estado2 = request.getParameter("estado");
                        String usuario2 = request.getParameter("usuario");
                        String clave2 = request.getParameter("clave");
                        String saldo2 = request.getParameter("saldo");

                        if ((dni2.isEmpty()) || (nombre2.isEmpty()) || (apellido2.isEmpty()) || (direccion2.isEmpty()) || (estado2.isEmpty()) || (usuario2.isEmpty()) || (clave2.isEmpty()) || (saldo2.isEmpty())) {
                            request.setAttribute("estado", 1);
                        } else {
                            cli.setId(idc);
                            cli.setDni(dni2);
                            cli.setNombre(nombre2);
                            cli.setApellido(apellido2);
                            cli.setDireccion(direccion2);
                            cli.setEstado(estado2);
                            cli.setUsuario(usuario2);
                            cli.setClave(clave2);
                            cli.setSaldo(Double.valueOf(saldo2));

                            adao.editar(cli);
                            request.setAttribute("estado", 5);
                        }

                        request.getRequestDispatcher("Controlador?accion=ABMUsuario&subaccion=Listar").forward(request, response);
                        break;
                }
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                break;
            case "BorrarCarrito":
                idp = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < lista3.size(); i++) {
                    if (lista3.get(i).getIdP().equals(idp)) {
                        lista3.remove(i);
                    }
                }
                request.getRequestDispatcher("Controlador?accion=ListarCarrito&id=" + idCLIEN).forward(request, response);
                break;
            case "BorrarTodoCarrito":
                lista3.clear();
                request.getRequestDispatcher("Controlador?accion=ListarCarrito&id=" + idCLIEN).forward(request, response);
                break;
            case "AgregarItem":

                boolean esta = false;
                vent = new Venta();
                item = item + 1;
                codI = Integer.parseInt(request.getParameter("id"));
                descripcion3 = request.getParameter("nom");
                precio3 = Double.parseDouble(request.getParameter("pre"));
                String cant5 = request.getParameter("canti");
                int stock3 = Integer.parseInt(request.getParameter("stock"));
                subtotal3 = precio3 * cant3;
                if (cant5.isEmpty()) {
                    request.setAttribute("estado", 5);
                } else {
                    cant3 = Integer.parseInt(cant5);
                    if (cant3 >= 1) {
                        if (cant3 <= stock3) {
                            for (int i = 0; i < lista3.size(); i++) {
                                if (lista3.get(i).getIdP().equals(codI)) {
                                    lista3.get(i).setCant(lista3.get(i).getCant() + cant3);
                                    esta = true;
                                    request.setAttribute("estado", 3);
                                }
                            }
                            if (esta == false) {
                                vent.setItem(item);
                                vent.setIdP(codI);
                                vent.setNomPro(descripcion3);
                                vent.setPrecio(precio3);
                                vent.setCant(cant3);
                                vent.setSubtotal(subtotal3);
                                lista3.add(vent);
                                request.setAttribute("estado", 2);
                            }
                            request.setAttribute("lista", lista3);
                        } else {
                            request.setAttribute("estado", 4);
                        }
                    } else {
                        request.setAttribute("estado", 1);
                    }
                }
                request.getRequestDispatcher("Controlador?accion=Compra&subaccion=Listar").forward(request, response);
                break;
            case "ListarCarrito":
                total = 0.0;
                idCLIEN = Integer.parseInt(request.getParameter("id"));
                numeroserie = vdao.GenerarSerie();
                if (numeroserie == null) {
                    numeroserie = "000000001";
                    request.setAttribute("nserie", numeroserie);
                } else {
                    int inc = Integer.parseInt(numeroserie);
                    GenerarSerie gs = new GenerarSerie();
                    numeroserie = gs.NumeroSerie(inc);
                    request.setAttribute("nserie", numeroserie);
                }
                for (int i = 0; i < lista3.size(); i++) {
                    total = total + lista3.get(i).getSubtotal();
                }
                request.setAttribute("total", total);
                request.setAttribute("lista", lista3);
                request.setAttribute("id", idCLIEN);
                request.getRequestDispatcher("Carrito.jsp").forward(request, response);

                break;
            case "VolverAdministrador":
                String usuarioCompleto = request.getParameter("usuario");

                if (usuarioCompleto.isEmpty()) {
                    request.setAttribute("estado", 8);
                } else {
                    cli = cdao.buscarPorUsuario(usuarioCompleto);
                    if (cli.getUsuario() == null) {
                        request.setAttribute("estado", 9);
                    } else {
                        int id4 = cli.getId();
                        String dni4 = cli.getDni();
                        String nombre4 = cli.getNombre();
                        String apellido4 = cli.getApellido();
                        String estado4 = cli.getEstado();
                        String usuario4 = cli.getUsuario();
                        String clave4 = cli.getClave();

                        cli.setDni(dni4);
                        cli.setNombre(nombre4);
                        cli.setApellido(apellido4);
                        cli.setEstado(estado4);
                        cli.setUsuario(usuario4);
                        cli.setClave(clave4);
                        adao.agregarADM(cli);
                        request.setAttribute("estado", 10);
                        adao.borrar(id4);
                    }
                }
                request.getRequestDispatcher("Controlador?accion=ABMUsuario&subaccion=Listar").forward(request, response);
                break;
            case "NuevaVenta":

                idCLIEN = Integer.parseInt(request.getParameter("id"));

                Cliente c = new Cliente();
                c = cdao.buscar(idCLIEN);
                if (total > 0) {
                    if (c.getSaldo() >= total) {

                        double saldo2 = c.getSaldo() - total;
                        cdao.actualizarSaldo(idCLIEN, saldo2);

                        vent.setIdC(idCLIEN);
                        vent.setnSerie(numeroserie);
                        vent.setFecha(vdao.obtenerFecha());
                        vent.setMonto(total);
                        vent.setEstado("1");

                        for (int i = 0; i < lista3.size(); i++) {
                            Producto p = new Producto();
                            int cant = lista3.get(i).getCant();
                            idp = lista3.get(i).getIdP();
                            p = pdao.buscar(idp);
                            int cantstock = p.getStock() - cant;
                            pdao.actualizartock(idp, cantstock);
                        }
                        vdao.nuevaVenta(vent);

                        int idv = Integer.parseInt(vdao.Id());

                        for (int i = 0; i < lista3.size(); i++) {
                            vent = new Venta();
                            vent.setId(idv);
                            vent.setIdP(lista3.get(i).getIdP());
                            vent.setNomPro(lista3.get(i).getNomPro());
                            vent.setCant(lista3.get(i).getCant());
                            vent.setPrecio(lista3.get(i).getPrecio());
                            vdao.nuevoDetalle(vent);
                        }
                        request.setAttribute("estado", 1);
                    } else {
                        request.setAttribute("estado", 2);
                    }
                } else {
                    request.setAttribute("estado", 3);
                }

                request.getRequestDispatcher("Controlador?accion=ListarCarrito&id=" + idCLIEN).forward(request, response);
                break;

            case "ListarVentas":
                List lista2 = vdao.listar();
                request.setAttribute("lista2", lista2);
                request.setAttribute("cantidad", lista2.size());
                request.getRequestDispatcher("Venta.jsp").forward(request, response);
                break;
            case "VerDetalle":
                int idv = Integer.parseInt(request.getParameter("idv"));
                List<Detalle> lista4 = new ArrayList<>();
                lista4 = ddao.listarDetalleId(idv);
                request.setAttribute("lista4", lista4);
                request.setAttribute("nVent", lista4.get(0).getIdVentas());
                request.getRequestDispatcher("DetalleVenta.jsp").forward(request, response);
                break;
            case "ABMProducto":
                switch (subaccion) {
                    case "Listar":
                        List lista = pdao.listar();
                        request.setAttribute("productos", lista);
                        break;

                    case "Agregar":
                        String nombre = request.getParameter("nombre");
                        String descripcion = request.getParameter("descripcion");
                        String precio = request.getParameter("precio");
                        String stock = request.getParameter("stock");
                        String estado = request.getParameter("estado");

                        if ((nombre.isEmpty()) || (stock.isEmpty()) || (precio.isEmpty()) || (estado.isEmpty()) || descripcion.isEmpty()) {

                            request.setAttribute("estado", 1);

                        } else {
                            pro.setNombre(nombre);
                            pro.setDescripcion(descripcion);
                            pro.setPrecio(Double.parseDouble(precio));
                            pro.setStock(Integer.parseInt(stock));
                            pro.setEstado(estado);
                            pdao.agregar(pro);
                            request.setAttribute("estado", 4);
                        }

                        request.getRequestDispatcher("Controlador?accion=ABMProducto&subaccion=Listar").forward(request, response);
                        break;

                    case "Editar":
                        idp = Integer.parseInt(request.getParameter("id"));
                        Producto prod = pdao.listarId(idp);
                        request.setAttribute("producto", prod);
                        request.getRequestDispatcher("Controlador?accion=ABMProducto&subaccion=Listar").forward(request, response);
                        break;

                    case "Borrar":
                        idp = Integer.parseInt(request.getParameter("id"));
                        pdao.borrar(idp);
                        request.getRequestDispatcher("Controlador?accion=ABMProducto&subaccion=Listar").forward(request, response);
                        break;
                    case "Actualizar":

                        String nombre2 = request.getParameter("nombre");
                        String descripcion2 = request.getParameter("descripcion");
                        String precio2 = request.getParameter("precio");
                        String stock2 = request.getParameter("stock");
                        String estado2 = request.getParameter("estado");

                        if ((nombre2.isEmpty()) || (descripcion2.isEmpty()) || (precio2.isEmpty()) || (stock2.isEmpty()) || (estado2.isEmpty())) {
                            request.setAttribute("estado", 1);
                        } else {
                            pro.setId(idp);
                            pro.setNombre(nombre2);
                            pro.setDescripcion(descripcion2);
                            pro.setPrecio(Double.parseDouble(precio2));
                            pro.setStock(Integer.parseInt(stock2));
                            pro.setEstado(estado2);

                            pdao.editar(pro);
                            request.setAttribute("estado", 6);
                        }

                        request.getRequestDispatcher("Controlador?accion=ABMProducto&subaccion=Listar").forward(request, response);
                        break;
                }
                request.getRequestDispatcher("ProductosABM.jsp").forward(request, response);
                break;
            case "ABMUsu":
                switch (subaccion) {
                    case "Cargar":
                        idc = Integer.parseInt(request.getParameter("id"));
                        Cliente clie = adao.listarId(idc);
                        request.setAttribute("cliente", clie);
                        break;
                    case "Modificar":
                        String dni = request.getParameter("dni");
                        String nombre = request.getParameter("nombre");
                        String apellido = request.getParameter("apellido");
                        String direccion = request.getParameter("direccion");
                        String estado = request.getParameter("estado");
                        String usuario = request.getParameter("usuario");
                        String clave = request.getParameter("clave");
                        Double saldo = Double.valueOf(request.getParameter("saldo"));

                        if (!nombre.isEmpty() && !apellido.isEmpty() && !direccion.isEmpty() && !clave.isEmpty()) {
                            cli.setId(idc);
                            cli.setDni(dni);
                            cli.setNombre(nombre);
                            cli.setApellido(apellido);
                            cli.setDireccion(direccion);
                            cli.setEstado(estado);
                            cli.setUsuario(usuario);
                            cli.setClave(clave);
                            cli.setSaldo(saldo);
                            cdao.editar(cli);
                            request.setAttribute("estado", 1);
                        } else {
                            request.setAttribute("estado", 2);
                        }
                        request.getRequestDispatcher("Controlador?accion=ABMUsu&subaccion=Cargar&id=" + idc).forward(request, response);
                        break;
                    case "Regresar":
                        request.getRequestDispatcher("Controlador?accion=Compra&subaccion=Listar").forward(request, response);
                        break;
                }
                request.getRequestDispatcher("CambiarDatos.jsp").forward(request, response);
                break;
            case "Compra":
                switch (subaccion) {
                    case "Listar":
                        List lista = pdao.listar();
                        request.setAttribute("productos", lista);
                        break;
                }
                request.getRequestDispatcher("Inicio.jsp").forward(request, response);
                break;
            case "Salir":
                lista3.clear();
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
