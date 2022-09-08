<%-- 
    Document   : CategoriasVista
    Created on : 22 jun. 2022, 19:23:15
    Author     : Jeffal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
        <script src="./js/CategoriasJS.js"></script>
        <%@include file="./librerias/libs.jsp"%>
    </head>
    <body>
        <%@include file="./librerias/menu.jsp"%>
        <div class="container" align="center">
            <h1>Categorias</h1>
            <hr>
            <form>
                <table>
                    <tr>
                        <td>
                            <label>Buscar:</label>
                        </td>
                        <td>
                            <input type="text" id="buscarC" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="button" 
                                    class="btn btn-primary"
                                    style="width: 80px; height: 40px" onclick="readCategorias()">Buscar</button>
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
                   <!-- Borrar este boton -->
                    <tr>
                        <td></td>
                        <td>
                            <button type="button" 
                                    class="btn btn-success"
                                    style="width: 80px; height: 40px"
                                    data-toggle="modal" 
                                    data-target="#actualizarModal">Actualizar</button>
                        </td>
                    </tr>
                    <!-- Borrar Hasta aqui -->
                </table>
            </form>
            <hr>
            <div id="tablaCategoria"></div>
            
        </div>


        <!-- INICIO Modal -->
        <div class="modal" id="insertarModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Insertar Categoria</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <form>
                            <table>
                                <tr>
                                    <td>
                                        <label>Categoria:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtCategoria" class="form-control"/>
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
                                                class="btn btn-success" onclick="insertarCategorias()">Insertar</button>  
                                    </td>
                                </tr>
                            </table>
                        </form>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" id="closeInsertar">Close</button>
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
                        <h4 class="modal-title">Actualizar Categoria</h4>
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
                                <tr>
                                    <td>
                                        <label>Categoria:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtCategoriaUp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Fecha:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtFechaUp" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <button type="button" 
                                                class="btn btn-success" onclick="updateCategorias()">Actualizar</button>  
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

        
        
        
        <!-- INICIO Modal Eliminar -->
        <div class="modal" id="eliminarModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header" >
                        <h4 class="modal-title" >Eliminar Categoria</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <input type="hidden" id="numIdDel"/>
                        <h3>¿Desea Eliminar la Categoria?</h3>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="deleteCategorias()" >Si</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" id="deleteClose">No</button>
                    </div>

                </div>
            </div>
        </div>
        <!-- FIN Modal -->
    </body>
</html>
