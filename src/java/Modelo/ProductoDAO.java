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
public class ProductoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int b;

    public List listar() {
        String sql = "select * from producto";
        List<Producto> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto pro = new Producto();
                pro.setId(rs.getInt(1));
                pro.setNombre(rs.getString(3));
                pro.setDescripcion(rs.getString(2));
                pro.setPrecio(rs.getDouble(4));
                pro.setStock(rs.getInt(5));
                pro.setEstado(rs.getString(6));
                lista.add(pro);
            }
        } catch (SQLException e) {
        }
        return lista;
    }

    public int agregar(Producto p) {
        String sql = "insert into producto (Nombre,Descripcion,Precio,Stock,Estado) values (?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getDescripcion());
            ps.setDouble(3, p.getPrecio());
            ps.setInt(4, p.getStock());
            ps.setString(5, p.getEstado());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return b;
    }

    public Producto listarId(int id) {
        Producto pro = new Producto();
        String sql = "select * from producto where IdProducto=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                pro.setNombre(rs.getString(3));
                pro.setDescripcion(rs.getString(2));
                pro.setPrecio(rs.getDouble(4));
                pro.setStock(rs.getInt(5));
                pro.setEstado(rs.getString(6));
            }
        } catch (SQLException e) {
        }
        return pro;
    }

    public int editar(Producto p) {
        String sql = "update producto set Nombre=?, Descripcion=?, Precio=?, Stock=?, Estado=? where IdProducto=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());
            ps.setString(2, p.getDescripcion());
            ps.setDouble(3, p.getPrecio());
            ps.setInt(4, p.getStock());
            ps.setString(5, p.getEstado());
            ps.setInt(6, p.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return b;
    }

    public void borrar(int id) {
        String sql = "delete from producto where IdProducto=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Producto buscar(int id) {
        Producto p = new Producto();
        String sql = "select * from producto where IdProducto=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(3));
                p.setDescripcion(rs.getString(2));
                p.setPrecio(rs.getDouble(4));
                p.setStock(rs.getInt(5));
                p.setEstado(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return p;
    }

    public int actualizartock(int id, int stock) {
        String sql = "update producto set Stock=? where IdProducto=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return b;
    }
}
