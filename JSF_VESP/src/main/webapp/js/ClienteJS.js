/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.onload=function (){
    readClientes();
  
};
function readClientes(){
    let buscar = document.getElementById('buscarCl').value;
    //localhost:8080/JSP_VESP/CategoriasServlet?crud=select&txtBuscar=
    $.ajax({
        data: {
            "crud": "select",
            "txtBuscar": buscar
        },
        url: "./ClientesServlet",
        async: true,
        type: "GET",
        dataType: "text",
        success: function (datos){
            document.getElementById('tablaCliente').innerHTML=datos;
        }
    });
   
    
    
}

function insertarClientes(){
    let nom= document.getElementById('txtNombre').value;
    let doc=document.getElementById('txtDocumento').value;
    let ema=document.getElementById('txtEmail').value;
    let tel=document.getElementById('txtTelefono').value;
    let dir=document.getElementById('txtDireccion').value;
    let fecna=document.getElementById('txtFechaNacimiento').value;
    let com=document.getElementById('txtCompras').value;
    let ultc=document.getElementById('txtUltimaCompra').value;
    let fec=document.getElementById('txtFecha').value;
    alert(nom+"\n"+doc+"\n"+ema+"\n"+tel+"\n"+dir+"\n"+fecna+"\n"+com+"\n"+ultc+"\n"+fec);
    
    $.ajax({
        
        data:{
            "crud":"insert",
            "txtNombre":nom,
            "txtDocumento":doc,
            "txtEmail": ema,
            "txtTelefono": tel,
            "txtDireccion": dir,
            "txtFechaNacimiento": fecna,
            "txtCompras": com,
            "txtUltimaCompra": ultc,
            "txtFecha": fec
        },
        url:"./ClientesServlet",
        async: true,
        type: "GET",
        dataType: "text",
        success:function(datos){
            datos=datos.trim();
            if(datos==='true'){
                alert("Categoria insertada");
            }else{
               alert("Categoria no insertada"); 
            }
            document.getElementById('closeInsertar').click();
                readClientes()();
        } 
    });
}

function cargarDatosActualizar1(id, nom, doc, ema, tel, dir, fecna, com, ultc, fec){
document.getElementById('numId').value=id;  
document.getElementById('txtNombreOp').value=nom;
document.getElementById('txtDocumentoOp').value=doc;
document.getElementById('txtEmailOp').value=ema;
document.getElementById('txtTelefonoOp').value=tel;
document.getElementById('txtDireccionOp').value=dir;
document.getElementById('txtFechaNacimientoOp').value=fecna;
document.getElementById('txtComprasOp').value=com;
document.getElementById('txtUltimaCompraOp').value=ultc;
document.getElementById('txtFechaOp').value=fec;
}

function updateClientes(){
    let id= document.getElementById('numId').value;
    let No= document.getElementById('txtNombreOp').value;
    let doc=document.getElementById('txtDocumentoOp').value;
    let em=document.getElementById('txtEmailOp').value;
    let te=document.getElementById('txtTelefonoOp').value;
    let dir=document.getElementById('txtDireccionOp').value;
    let fen=document.getElementById('txtFechaNacimientoOp').value;
    let co=document.getElementById('txtComprasOp').value;
    let ulco=document.getElementById('txtUltimaCompraOp').value;
    let feo=document.getElementById('txtFechaOp').value;
    $.ajax({
        
        data:{
            "crud":"update",
            "numId": id,
            "txtNombre":No,
            "txtDocumento":doc,
            "txtEmail": em,
            "txtTelefono": te,
            "txtDireccion": dir,
            "txtFechaNacimiento": fen,
            "txtCompras": co,
            "txtUltimaCompra": ulco,
            "txtFecha": feo
        },
        url:"./ClientesServlet",
        async: true,
        type: "GET",
        dataType: "text",
        success:function(datos){
            datos=datos.trim();
            if(datos==='true'){
                alert("Categoria Actualizada");
            }else{
               alert("Categoria no Actualizada"); 
            }
            document.getElementById('closeUpdate').click();
            readClientes();
        } 
    });
}

function cargarIdEliminar1(id){
    alert(id);
document.getElementById('numIdDel2').value=id; 

}

function deleteClientes1(){
    let id=document.getElementById('numIdDel2').value;
    $.ajax({
        data:{
            "crud":"delete",
            "txtId": id
        },
        url:"./ClientesServlet",
        async:true,
        type:"GET",
        dataType:"text",
        success:function(datos){
            datos=datos.trim();
            if(datos==='true'){
                alert("Categoria Eliminada");
            }else{
               alert("Categoria no Eliminada"); 
            }
            document.getElementById('deleteClose').click();
            readClientes();
        }
    })
}


