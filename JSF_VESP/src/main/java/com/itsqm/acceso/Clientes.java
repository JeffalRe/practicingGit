/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itsqm.acceso;

import com.itsqm.modelo.CBDD;
import java.sql.ResultSet;

/**
 *
 * @author Jeffal
 */
public class Clientes {
     private int id;
    private String nombre;
    private int documento;
    private String email;
    private String telefono;
    private String direccion;
    private String fechaNacimiento;
    private int compras;
    private String ultimaCompra;
    private String fecha;
    private CBDD cbdd;
    
    public Clientes() {
        cbdd = new CBDD();
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDocumento() {
        return documento;
    }

    public void setDocumento(int documento) {
        this.documento = documento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getCompras() {
        return compras;
    }

    public void setCompras(int compras) {
        this.compras = compras;
    }

    public String getUltimaCompra() {
        return ultimaCompra;
    }

    public void setUltimaCompra(String ultimaCompra) {
        this.ultimaCompra = ultimaCompra;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public boolean insertCliente(String nombre, int documento, String email, String telefono, String direccion, String fechaNacimiento, int compras, String ultimaCompra, String fecha) {

        setNombre(nombre);
        setDocumento(documento);
        setEmail(email);
        setTelefono(telefono);
        setDireccion(direccion);
        setFechaNacimiento(fechaNacimiento);
        setCompras(compras);
        setUltimaCompra(ultimaCompra);
        setFecha(fecha);

        String sql = "INSERT INTO `clientes`" + "(`nombre`, `documento`,`email`,`telefono`,`direccion`,`fecha_nacimiento`,`compras`,`ultima_compra`,`fecha`)"
                + " VALUES ('" + getNombre() + "'," + getDocumento() + "," + "'" + getEmail() + "','" + getTelefono() + "','" + getDireccion() + "','" + getFechaNacimiento() + "'," + getCompras() + ",'" + getUltimaCompra() + "','" + getFecha() + "')";
        CBDD cbdd = new CBDD();
        boolean r = cbdd.ejecutar(sql);
        return r;
    }
    
    public boolean deleteCliente(int id){
        setId(id);
        String sql="DELETE FROM `clientes` "+"WHERE `id` ="+getId();
        boolean r = cbdd.ejecutar(sql);
        return r;
        
      
    }
    
    public boolean updateCliente(int id, String nombre, int documento, String email, String telefono, String direccion, String fechaNacimiento, int compras, String ultimaCompra, String fecha) {
        setId(id);
        setNombre(nombre);
        setDocumento(documento);
        setEmail(email);
        setTelefono(telefono);
        setDireccion(direccion);
        setFechaNacimiento(fechaNacimiento);
        setCompras(compras);
        setUltimaCompra(ultimaCompra);
        setFecha(fecha);
        String sql = "UPDATE `clientes` \n"
                + "SET `nombre`='" + getNombre()+ "',\n"
                + "`documento`=" + getDocumento() + ", \n"
                + "`email`='" + getEmail() + "', \n"
                + "`telefono`='" + getTelefono() + "', \n"
                + "`direccion`='" + getDireccion() + "', \n"
                + "`fecha_nacimiento`='" + getFechaNacimiento() + "', \n"
                + "`compras`=" + getCompras() + ", \n"
                + "`ultima_compra`='" + getUltimaCompra() + "', \n"
                + "`fecha`='" + getFecha() + "' \n"
                + "WHERE `id`= " + getId();
        return cbdd.ejecutar(sql);
    }
    
    public ResultSet selectClientes(String buscar) {
        //setBuscar(buscar);
        String sql = "SELECT * FROM `clientes` \n"
                + "WHERE `nombre` like '%" + buscar + "%'";
        //probar con mas campos where
        return cbdd.consulta(sql);
    }
    
}
