/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.onload=function (){
    readCategorias();
  
};


function readCategorias(){
    let buscar = document.getElementById('buscarC').value;
    //localhost:8080/JSP_VESP/CategoriasServlet?crud=select&txtBuscar=
    $.ajax({
        data: {
            "crud": "select",
            "txtBuscar": buscar
        },
        url: "./CategoriasServlet",
        async: true,
        type: "GET",
        dataType: "text",
        success: function (datos){
            document.getElementById('tablaCategoria').innerHTML=datos;
        }
    });
    
}

function insertarCategorias(){
    let cat= document.getElementById('txtCategoria').value;
    let fecha=document.getElementById('txtFecha').value;
    
    alert(cat+"\n"+fecha);
    
    $.ajax({
        
        data:{
            "crud":"insert",
            "txtCategoria":cat,
            "txtFecha": fecha
        },
        url:"./CategoriasServlet",
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
            readCategorias();
        } 
    });
}

function cargarDatosActualizar(id, cat, fec){
document.getElementById('numId').value=id;  
document.getElementById('txtCategoriaUp').value=cat;
document.getElementById('txtFechaUp').value=fec;
}

function updateCategorias(){
    let id= document.getElementById('numId').value;
    let c= document.getElementById('txtCategoriaUp').value;
    let f=document.getElementById('txtFechaUp').value;
    $.ajax({
        
        data:{
            "crud":"update",
            "numId": id,
            "txtCategoria":c,
            "txtFecha": f
        },
        url:"./CategoriasServlet",
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
            readCategorias();
        } 
    });
}

function cargarIdEliminar(id){
    alert(id);
document.getElementById('numIdDel').value=id; 

}

function deleteCategorias(){
    let id=document.getElementById('numIdDel').value;
    $.ajax({
        data:{
            "crud":"delete",
            "txtId": id
        },
        url:"./CategoriasServlet",
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
            readCategorias();
        }
    })
}