/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Conexiones.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Ale
 */
public class VentaDAO {
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int res;
    
    public String GenerarSerie(){
        String numeroserie="";
        String sql="select max(NumeroSerie) from ventas";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()){
                numeroserie=rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return numeroserie;
    }
    
    public String Id(){
        String id="";
        String sql = "select MAX(IdVentas) from ventas";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()){
                id=rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return id;
    }
    
    public int nuevaVenta(Venta venta){
        String sql="insert into ventas(IdCliente, NumeroSerie, FechaVentas, Monto, Estado) values (?,?,?,?,?)";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, venta.getIdC());
            ps.setString(2,venta.getnSerie());
            ps.setString(3,venta.getFecha());
            ps.setDouble(4,venta.getMonto());
            ps.setString(5, venta.getEstado());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return res;
    }
    
    public int nuevoDetalle(Venta venta){
        String sql = "insert into detalle_ventas(IdVentas, IdProducto, Nombre, Cantidad, PrecioVenta)values(?,?,?,?,?)";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, venta.getId());
            ps.setInt(2, venta.getIdP());
            ps.setString(3,venta.getNomPro());
            ps.setInt(4, venta.getCant());
            ps.setDouble(5, venta.getPrecio());
            ps.executeUpdate();
            
        } catch (SQLException e) {
        }
        return res;
    }
    
    public List listar() {
        String sql = "select * from ventas";
        List<Venta> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta ven = new Venta();
                ven.setId(rs.getInt(1));
                ven.setIdC(rs.getInt(2));
                ven.setnSerie(rs.getString(3));
                ven.setFecha(rs.getString(4));
                ven.setMonto(rs.getDouble(5));
                ven.setEstado(rs.getString(6));
                lista.add(ven);
            }
        } catch (SQLException e) {
        }
        return lista;
    }
    
    public String obtenerFecha(){
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = new Date();
        return formatoFecha.format(fecha);
    }
}



