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
import static java.time.Clock.system;
import static java.time.InstantSource.system;

/**
 *
 * @author Ale
 */
public class ClienteDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int id;
    int b;
    
    public Cliente validar(String usuario, String clave) {
        Cliente cli = new Cliente();
        String sql = "select * from cliente where Usuario=? and Clave=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setUsuario(rs.getString("Usuario"));
                cli.setClave(rs.getString("Clave"));
                cli.setNombre(rs.getString("Nombre"));
                cli.setApellido(rs.getString("Apellido"));
                cli.setSaldo(rs.getDouble("Saldo"));
                cli.setId(Integer.parseInt(rs.getString("IdCliente")));
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
            
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return b;
    }
    
    public int darId(){
        return id;
    }
    
    public Cliente buscar(int id) {
        Cliente c = new Cliente();
        String sql = "select * from cliente where IdCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                c.setId(rs.getInt(1));
                c.setDni(rs.getString(2));
                c.setNombre(rs.getString(3));
                c.setApellido(rs.getString(4));
                c.setDireccion(rs.getString(5));
                c.setEstado(rs.getString(6));
                c.setUsuario(rs.getString(7));
                c.setClave(rs.getString(8));
                c.setSaldo(rs.getDouble(9));
                
            }
        } catch (Exception e) {
        }
        return c;
    }

    public int actualizarSaldo(int id, double saldo) {
        String sql = "update cliente set Saldo=? where IdCliente=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, saldo);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return b;
    }
    
    public Cliente verSaldo(int id) {
        Cliente c = new Cliente();
        String sql = "select Saldo from cliente where IdCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setSaldo(rs.getDouble(1));
            }
        } catch (Exception e) {
        }
        return c;
    }
    
    public Cliente buscarPorUsuario(String usuario) {
        Cliente c = new Cliente();
        String sql = "select * from cliente where Usuario='" + usuario+"'";
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt(1));
                c.setDni(rs.getString(2));
                c.setNombre(rs.getString(3));
                c.setApellido(rs.getString(4));
                c.setDireccion(rs.getString(5));
                c.setEstado(rs.getString(6));
                c.setUsuario(rs.getString(7));
                c.setClave(rs.getString(8));
                c.setSaldo(rs.getDouble(9));
            }
        } catch (Exception e) {
        }
        return c;
    }
    
    public boolean comprobarUsuario(String usuario) {
        Cliente c = new Cliente();
        boolean disp = true;
        String sql = "select * from cliente ";
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setUsuario(rs.getString(7));
                if(c.getUsuario().equals(usuario)){
                    disp=false;
                }
            }
        } catch (SQLException e) {
        }
        return disp;
    }
}
