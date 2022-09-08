/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.itsqm.acceso;

import com.itsqm.modelo.CBDD;
import java.sql.ResultSet;

/**
 *
 * @author galar
 */
public class Categorias {

    private int id;
    private String categoria;
    private String fecha;
    private CBDD cbdd;
    private String buscar;

    public String getBuscar() {
        return buscar;
    }

    public void setBuscar(String buscar) {
        this.buscar = buscar;
    }

    public Categorias() {
        cbdd = new CBDD();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public boolean insertCategoria(String categoria, String fecha) {
        setCategoria(categoria);
        setFecha(fecha);
        String sql = "INSERT INTO `categorias`"
                + "(`categoria`, `fecha`) "
                + "VALUES ('" + getCategoria() + "',"
                + "'" + getFecha() + "')";
        boolean r = cbdd.ejecutar(sql);
        return r;
    }

    public boolean deleteCategoria(int id) {
        setId(id);
        String sql = "DELETE FROM `categorias` "
                + "WHERE `id` =" + getId();
        boolean r = cbdd.ejecutar(sql);
        return r;
    }

    public boolean updateCategorias(int id, String categorias, String fecha) {
        setId(id);
        setCategoria(categorias);
        setFecha(fecha);
        String sql = "UPDATE `categorias` \n"
                + "SET `categoria`='" + getCategoria() + "',\n"
                + "`fecha`='" + getFecha() + "' \n"
                + "WHERE `id`= " + getId();
        return cbdd.ejecutar(sql);
    }

    public ResultSet selectCategorias(String buscar) {
        //setBuscar(buscar);
        String sql = "SELECT * FROM `categorias` \n"
                + "WHERE `categoria` like '%" + buscar + "%'";
        return cbdd.consulta(sql);
    }
}
