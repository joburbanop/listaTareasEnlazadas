<%-- 
    Document   : listas
    Created on : 10 oct 2023, 16:41:28
    Author     : danie
--%>

<%@page import="java.util.List"%>
<%@page import="com.umariana.mavenproject1.Tarea"%>
<%@page import="java.io.File"%>
<%@page import="com.umariana.mavenproject1.ControlUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.umariana.mavenproject1.Usurios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@include file="/templates/header.jsp" %>
<%
    
              
    
   String nombreUsuario = (String) session.getAttribute("nombre_usuario");
   String cedulaUsuario = (String) session.getAttribute("cedula_usuario");
   // Accede a otros atributos del usuario que desees utilizar
   
            
              
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<section class="vh-100" style="background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));">
    <div class="container p-4"> <!-- clase contenedora -->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: white;">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="#" style="color: black;">
                    <i class="fas fa-cubes fa-2x me-3" style="color: lightblue;"></i>
                    <span style="line-height: 1.2;"></span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                    <ul class="navbar-nav">
                   
                     
                    </ul>
                    <div class="navbar-text text-center" style="color: black;">
                        Hola, <%= nombreUsuario%>!
                    </div>
                    <a href="/mavenproject1" class="btn btn-warning" style="background-color: lightblue; border-color: lightblue; color: black;">Cerrar Sesión</a>
                </div>
            </div>
        </nav>

        
         <h1 class="text-center mt-4 mb-4" style="color: black;">Tareas</h1>
        <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center"> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                <div class="card card-body text-center" style="background-color: white; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                    <h4 class="text-center" style="color: black;">Agrega tareas</h4>
                    
                    <%-- formulario para agregar tareas --%>
                    <form action="/mavenproject1/SvCrearTarea" method="post">

                        <div class="input-group mb-3">
                            <label class="input-group-text" for="nombre">Id</label>
                            <input type="text" name="id" class="form-control">
                        </div>

                        <div class="input-group mb-3">
                            <label class="input-group-text" for="raza">Titulo</label>
                            <input type="text" name="titulo" class="form-control">
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="nombre">Descripcion</label>
                            <input type="text" name="descripcion" class="form-control">
                        </div>

                        <div class ="input-group mb-3">
                            <label class="input-group-text" for="fecha">Fecha de vencimiento</label>
                            <input type="date" name="fecha" class="form-control">
                        </div>
                        <input type="submit" value="Agregar tarea" >
                    </form>
                    
                    
                </div>
            </div>

            <%-- tabla para visualizar las tareas agregadas --%>
            <div class="col-md-8">
                <div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Titulo</th>
                                <th>Descripción</th>
                                <th>Fecha de Vencimiento</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            // Obtén las tareas asociadas al usuario activo (supongamos que tienes una lista de tareas en la sesión)
                            List<Tarea> tareas = (List<Tarea>) session.getAttribute("tareas");

                            if (tareas != null && !tareas.isEmpty()) {
                                int contador = 1;
                                for (Tarea tarea : tareas) {
                            %>
                            <tr>
                                <td><%= contador %></td>
                                <td><%= tarea.getTitulo() %></td>
                                <td><%= tarea.getDescripcion() %></td>
                                <td><%= tarea.getFechaVencimiento() %></td>
                                <td>
                                    <button class="btn btn-primary" onclick="editarTarea('<%= tarea.getId() %>')">Editar</button>
                                    <button class="btn btn-danger" onclick="eliminarTarea('<%= tarea.getTitulo() %>')">Eliminar</button>
                                    
                                </td>
                            </tr>
                            <%
                                        contador++;
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="5">No tienes tareas disponibles.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</section>
<%@include file="/templates/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function editarTarea(id) {
        // Agregar código para editar una tarea (por ejemplo, abrir un formulario de edición)
        alert('Editar tarea con ID: ' + id);
    }

        function eliminarTarea(titulo){
        // Agregar código para eliminar una tarea (por ejemplo, mostrar un mensaje de confirmación)
        var confirmar = confirm('¿Estás seguro de que deseas eliminar la tarea con ID ' + titulo + '?');
        
        if (confirmar) {
            // Realizar la eliminación de la tarea aquí (puede usar AJAX para comunicarse con el servidor)
                   
                    $.ajax({  
                        
<<<<<<< HEAD
                        url: 'SvEliminarTarea?titulo='+titulo,
=======
                        url: 'SvEliminarTarea?titulo=' + titulo,
>>>>>>> 72ac9d1e3c8f6844f4db5121dc6688441f229ae6
                        method: 'POST',
                        
                    success: function(){
                        console.log("Aqui estoy");
                        window.location.href= 'templates/listas.jsp';
                    },
                    error: function(){
                        console.log("paila");
                    }
                });
            alert('Tarea eliminada con exito');
       
        } 
    }
</script>


</body>
</html>

