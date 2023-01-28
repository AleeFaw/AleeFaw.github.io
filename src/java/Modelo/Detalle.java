/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Ale
 */
public class Detalle {

    int idDetalleVentas;
    int idVentas;
    int idProducto;
    String nombre;
    int Cantidad;
    double PrecioVenta;

    public Detalle() {
    }

    public Detalle(int idDetalleVentas, int idVentas, int idProducto, String nombre, int Cantidad, double PrecioVenta) {
        this.idDetalleVentas = idDetalleVentas;
        this.idVentas = idVentas;
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.Cantidad = Cantidad;
        this.PrecioVenta = PrecioVenta;
    }

    public int getIdDetalleVentas() {
        return idDetalleVentas;
    }

    public void setIdDetalleVentas(int idDetalleVentas) {
        this.idDetalleVentas = idDetalleVentas;
    }

    public int getIdVentas() {
        return idVentas;
    }

    public void setIdVentas(int idVentas) {
        this.idVentas = idVentas;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getPrecioVenta() {
        return PrecioVenta;
    }

    public void setPrecioVenta(double PrecioVenta) {
        this.PrecioVenta = PrecioVenta;
    }
    
    
}
