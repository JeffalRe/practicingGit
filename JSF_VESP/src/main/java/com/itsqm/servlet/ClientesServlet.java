/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itsqm.servlet;

import com.itsqm.acceso.Clientes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jeffal
 */
@WebServlet(name = "ClientesServlet", urlPatterns = "/ClientesServlet")
public class ClientesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("crud");
        if (menu.equals("select")) {
            //Read
            selectClientes(request, response);
        } else if (menu.equals("update")) {
            //Update
            updateClientes(request, response);
        } else if (menu.equals("insert")) {
            //Insert
            insertClientes(request, response);
        } else if (menu.equals("delete")) {
            //Delete
            deleteClientes(request, response);

        }

    }

    private void deleteClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            int id = Integer.parseInt(request.getParameter("txtId"));
            Clientes c = new Clientes();
            boolean r = c.deleteCliente(id);
            pw.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void insertClientes(HttpServletRequest request, HttpServletResponse response) {
        //String nombre, int documento, String email, String telefono, String direccion, String fechaNacimiento, int compras, String ultimaCompra, String fecha
        try {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            String nombre = request.getParameter("txtNombre");
            int documento = Integer.parseInt(request.getParameter("txtDocumento"));
            String email = request.getParameter("txtEmail");
            String telefono = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");
            String fecha_nacimiento = request.getParameter("txtFechaNacimiento");
            int compras = Integer.parseInt(request.getParameter("txtCompras"));
            String ultima_compra = request.getParameter("txtUltimaCompra");
            String fecha = request.getParameter("txtFecha");

            Clientes c = new Clientes();
            boolean r = c.insertCliente(nombre, documento, email, telefono, direccion, fecha_nacimiento, compras, ultima_compra, fecha);
            pw.println(r);
        } catch (Exception e) {

        }
    }

    private void updateClientes(HttpServletRequest request, HttpServletResponse response) {
        try {

            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            int id = Integer.parseInt(request.getParameter("numId"));
            String nombre = request.getParameter("txtNombre");
            int documento = Integer.parseInt(request.getParameter("txtDocumento"));
            String email = request.getParameter("txtEmail");
            String telefono = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");
            String fecha_nacimiento = request.getParameter("txtFechaNacimiento");
            int compras = Integer.parseInt(request.getParameter("txtCompras"));
            String ultima_compra = request.getParameter("txtUltimaCompra");
            String fecha = request.getParameter("txtFecha");
            Clientes c = new Clientes();
            //boolean r = c.updateCliente(id, nombre, documento, email, telefono, direccion, fecha_nacimiento, compras, ultima_compra, fecha);
            boolean r = c.updateCliente(id, nombre, documento, email, telefono, direccion, fecha_nacimiento, compras, ultima_compra, fecha);
            pw.println(r);
        } catch (Exception e) {

        }
    }

    private void selectClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            String buscar = request.getParameter("txtBuscar");
            Clientes c = new Clientes();
            ResultSet rs = c.selectClientes(buscar);
            String tabla = "<table class='table table-hover'>";
            tabla += "<thead class='thead-dark'>";
            tabla += "<tr>";
            tabla += "<th> ID";
            tabla += "</th>";
            tabla += "<th>NOMBRE";
            tabla += "</th>";
            tabla += "<th>DOCUMENTO";
            tabla += "</th>";
            tabla += "<th>EMAIL";
            tabla += "</th>";
            tabla += "<th>TELEFONO";
            tabla += "</th>";
            tabla += "<th>DIRECCION";
            tabla += "</th>";
            tabla += "<th>FECHA NACIMIENTO";
            tabla += "</th>";
            tabla += "<th>COMPRAS";
            tabla += "</th>";
            tabla += "<th>ULTIMA COMPRA";
            tabla += "</th>";
            tabla += "<th>FECHA";
            tabla += "</th>";
            tabla += "</tr>";
            tabla += "</thead>";
            tabla += "<tbody>";
            // ID Categoria Fecha            
            //<table>

            //</table>
            while (rs.next()) {
//                pw.println(rs.getInt("id"));
//                pw.println(rs.getString("categoria"));
//                pw.println(rs.getString("fecha"));
                tabla += "<tr>";
                tabla += "<td>" + rs.getInt("id");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("nombre");
                tabla += "</td>";
                tabla += "<td>" + rs.getInt("documento");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("email");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("telefono");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("direccion");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("fecha_nacimiento");
                tabla += "</td>";
                tabla += "<td>" + rs.getInt("compras");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("ultima_compra");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("fecha");
                tabla += "</td>";

                //botones de eliminar y actualizar
                tabla += "<td>";
                tabla += "<button type='button'class='btn btn-warning' data-toggle='modal' data-target='#actualizarModal' onclick=\"cargarDatosActualizar1('" + rs.getInt("id") + "','" + rs.getString("nombre") + "','" + rs.getInt("documento") + "','" + rs.getString("email") + "','" + rs.getString("telefono") + "','" + rs.getString("direccion") + "','" + rs.getString("fecha_nacimiento") + "','" + rs.getInt("compras") + "','" + rs.getString("ultima_compra") + "','" + rs.getString("fecha") + "')\">Actualizar</button>";
                tabla += "<button type='button'class='btn btn-danger' data-toggle='modal' data-target='#eliminar1Modal' onclick=\"cargarIdEliminar1('"+rs.getInt("id")+"')\">Elimniar</button>";
                tabla += "</td>";
                tabla += "</tr>";
            }
            tabla += "</tbody>";
            tabla += "</table>";

            //imprimir tabla
            pw.println(tabla);
        } catch (Exception e) {

        }
    }

}
