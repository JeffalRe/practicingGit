<%-- 
    Document   : ClienteVista
    Created on : 29 jun. 2022, 14:40:29
    Author     : Jeffal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <script src="./js/ClienteJS.js"></script>
        <%@include file="./librerias/libs.jsp" %>
    </head>
    <body>
        <%@include file="./librerias/menu.jsp" %>
        <div class="container" align="center">
            <h1>Clientes</h1>
            <hr>
            <form>
                <table>
                    <tr>
                        <td>
                            <label> Buscar: </label>
                        </td>
                        <td>
                            <input type="text" id="buscarCl" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="button" 
                                    class="btn btn-primary"
                                    style="width: 80px; height: 40px" onclick="readClientes()">Buscar</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="button" 
                                    class="btn btn-success"
                                    style="width: 80px; height: 40px"
                                    data-toggle="modal" 
                                    data-target="#insertarModal">Insertar</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="button" 
                                    class="btn btn-success"
                                    style="width: 120px; height: 40px"
                                    data-toggle="modal" 
                                    data-target="#actualizarModal">Actualizar</button>
                        </td>
                    </tr>

                </table>
            </form>
            <hr>
            <div id="tablaCliente"></div>
        </div>

        <!-- INICIO Modal -->
        <div class="modal" id="insertarModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Insertar Cliente</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <form>
                            <table>
                                <tr>
                                    <td>
                                        <label>Nombre:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtNombre" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Documento:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="txtDocumento" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Correo:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtEmail" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Telefono:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtTelefono" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Direccion:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtDireccion" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Fecha Nacimiento:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtFechaNacimiento" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Compras:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="txtCompras" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Ultima Compra:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtUltimaCompra" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Fecha:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtFecha" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <button type="button" 
                                                class="btn btn-success" onclick="insertarClientes()">Insertar</button>  
                                    </td>
                                </tr>
                            </table>
                        </form>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
        <!-- FIN Modal -->
        
        <!-- INICIO Modal actualizar -->
        <div class="modal" id="actualizarModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Actualizar Cliente</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <form>
                            <table>
                                <tr>
                                    <td>
                                        <label>ID:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="numId" class="form-control" readonly=""/>
                                    </td>
                                </tr>
                                
                                <!-- Revisar-->
                                <tr>
                                    <td>
                                        <label>Nombre:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtNombreOp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Documento:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="txtDocumentoOp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Correo:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtEmailOp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Telefono:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtTelefonoOp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Direccion:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtDireccionOp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Fecha Nacimiento:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtFechaNacimientoOp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Compras:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="txtComprasOp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Ultima Compra:</label>
                                    </td>
                                    <td>
                                        <input type="datetime" id="txtUltimaCompraOp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Fecha:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtFechaOp" class="form-control"/>
                                    </td>
                                </tr>
                                <!-- Fin Revisar-->
                                
                                
                                <tr>
                                    <td></td>
                                    <td>
                                        <button type="button" 
                                                class="btn btn-success" onclick="updateClientes()">Actualizar</button>  
                                    </td>
                                </tr>
                            </table>
                        </form>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" id="closeUpdate">Close</button>
                    </div>

                </div>
            </div>
        </div>
        <!-- FIN Modal -->
        
        
        
        
        <!-- INICIO Modal actualizar -->
        <div class="modal" id="eliminar1Modal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Eliminar Cliente</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <input type="text" id="numIdDel2"/>
                        <h3>¿Desea Eliminar el Cliente?</h3>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="deleteClientes1()">Si</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" id="deleteClose">No</button>
                    </div>

                </div>
            </div>
        </div>
        <!-- FIN Modal -->

    </body>
</html>
