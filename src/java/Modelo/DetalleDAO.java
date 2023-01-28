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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ale
 */


public class DetalleDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public List listarDetalleId(int id) {
        List<Detalle> lista = new ArrayList<>();
        String sql = "select * from detalle_ventas where IdVentas=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Detalle det = new Detalle();
                det.setIdVentas(rs.getInt(2));
                det.setIdProducto(rs.getInt(3));
                det.setNombre(rs.getString(4));
                det.setCantidad(rs.getInt(5));
                det.setPrecioVenta(rs.getDouble(6));
                lista.add(det);
            }
        } catch (SQLException e) {
        }
        return lista;
    }
    
}
