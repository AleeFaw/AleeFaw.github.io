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
public class AdminDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int b;

    public Admin validar(String usuario, String clave) {
        Admin adm = new Admin();
        String sql = "select * from admin where Usuario=? and Clave=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            while (rs.next()) {
                adm.setUsuario(rs.getString("Usuario"));
                adm.setClave(rs.getString("Clave"));
                adm.setNombre(rs.getString("Nombre"));
                adm.setApellido(rs.getString("Apellido"));
            }
        } catch (SQLException e) {
        }
        return adm;
    }

    public List listar() {
        String sql = "select * from cliente";
        List<Cliente> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setId(rs.getInt(1));
                cli.setDni(rs.getString(2));
                cli.setNombre(rs.getString(3));
                cli.setApellido(rs.getString(4));
                cli.setDireccion(rs.getString(5));
                cli.setEstado(rs.getString(6));
                cli.setUsuario(rs.getString(7));
                cli.setClave(rs.getString(8));
                cli.setSaldo(rs.getDouble(9));
                lista.add(cli);
            }
        } catch (SQLException e) {
        }
        return lista;
    }

    public int agregar(Cliente c) {
        String sql = "insert into cliente (Dni,Nombre,Apellido,Direccion,Estado,Usuario,Clave,Saldo) values (?,?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getDni());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getApellido());
            ps.setString(4, c.getDireccion());
            ps.setString(5, c.getEstado());
            ps.setString(6, c.getUsuario());
            ps.setString(7, c.getClave());
            ps.setDouble(8, c.getSaldo());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return b;
    }

    public Cliente listarId(int id) {
        Cliente cli = new Cliente();
        String sql = "select * from cliente where IdCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                cli.setDni(rs.getString(2));
                cli.setNombre(rs.getString(3));
                cli.setApellido(rs.getString(4));
                cli.setDireccion(rs.getString(5));
                cli.setEstado(rs.getString(6));
                cli.setUsuario(rs.getString(7));
                cli.setClave(rs.getString(8));
                cli.setSaldo(rs.getDouble(9));
            }
        } catch (SQLException e) {
        }
        return cli;
    }

    public int editar(Cliente c) {
        String sql = "update cliente set Dni=?, Nombre=?, Apellido=?, Direccion=?, Estado=?, Usuario=?, Clave=?, Saldo=? where IdCliente=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            
            ps.setString(1, c.getDni());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getApellido());
            ps.setString(4, c.getDireccion());
            ps.setString(5, c.getEstado());
            ps.setString(6, c.getUsuario());
            ps.setString(7, c.getClave());
            ps.setDouble(8, c.getSaldo());
            ps.setInt(9, c.getId());
            
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return b;
    }

    public void borrar(int id) {
        String sql = "delete from cliente where IdCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public int agregarADM(Cliente c) {
        String sql = "insert into admin (Dni,Nombre,Apellido,Estado,Usuario,Clave) values (?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getDni());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getApellido());
            ps.setString(4, c.getEstado());
            ps.setString(5, c.getUsuario());
            ps.setString(6, c.getClave());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return b;
    }
}
