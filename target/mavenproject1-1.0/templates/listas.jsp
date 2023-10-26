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

    /*---------------------------------------
    *Variables de inicio de session
    *------------------------------------------*/
    String nombreUsuario = (String) session.getAttribute("nombre_usuario");
    String cedulaUsuario = (String) session.getAttribute("cedula_usuario");
    // Accede a otros atributos del usuario que desees utilizar


%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="/mavenproject1/styleMain.css">
    </head>
    <body>
     
        <div class="wrapper"> <!-- clase contenedora -->
            <aside id="sidebar" style="height: 100vh;">
            <div class="h-100">

                <div class="sidebar-logo">
                    <a href="#"style="color: white">
                        <i class="fa-solid fa-door-open"></i>
                        Bienvenido <%= nombreUsuario%>
                    </a>
                </div>
                <!-- Sidebar Navigation -->
                <ul class="sidebar-nav">
                    <li class="sidebar-header"style="color: white">
                        CRUD
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" id="mostrarFormulario"style="color: white">
                            <i class="fa-solid fa-plus "></i>
                            Insertar Tarea
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" id = "mostrarTarea"style="color: white">
                            <i class="fa-solid fa-eye"></i>
                            Visualizar Tareas
                        </a>
                    </li>
                  
                    <li class="sidebar-item-1">
                        <a href="/mavenproject1" class="sidebar-link-2" style="color: white">
                            <i class="fa-solid fa-door-closed"></i>
                            Cerrar sesion
                        </a>
                    </li>
                    
                </ul>
                
            </div>
            
        </aside>

            <div class="container-fluid"> 
                <div class="row">
                    <div class="col-lg-12 d-flex justify-content-center align-items-center" style='margin-top: 100px;'> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                        
                           

                            <%-- formulario para agregar tareas --%>
                            <form id="formularioTarea" action="/mavenproject1/SvCrearTarea" method="post" style="display: none;">
                               <div class="card card-body text-center" style="background-color: white; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                                <h4 class="text-center" style="color: black;">Agrega tareas</h4>
                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="nombre">Id</label>
                                    <input type="text" name="id" class="form-control"  required>
                                </div>

                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="raza">Titulo</label>
                                    <input type="text" name="titulo" class="form-control" required>
                                </div>
                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="nombre">Descripcion</label>
                                    <input type="text" name="descripcion" class="form-control" required>
                                </div>

                                <div class ="input-group mb-3">
                                    <label class="input-group-text" for="fecha">Fecha de vencimiento</label>
                                    <input type="date" name="fecha" class="form-control" required>
                                </div>

                                <!-- Abrir modal de opciones -->
                                <input  type="submit" value="Agregar tarea"> 

                               </div>
                            </form>


                        
                    </div>

                    <!-- Modal para seleccionar la posición de la tarea -->
                    <div class="modal fade" id="modalAgregarTarea" tabindex="-1" role="dialog" aria-labelledby="modalAgregarTareaLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalAgregarTareaLabel">Seleccionar posición de la tarea</h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Cerrar">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Selecciona la posición para agregar la tarea:</p>
                                    <div class="form-check">
                                        <input type="radio" name="posicion" id="inicio" value="inicio" class="form-check-input">
                                        <label for="inicio" class="form-check-label">Al inicio</label>
                                    </div>

                                    <div class="form-check">
                                        <input type="radio" name="posicion" id="antes" value="antes" class="form-check-input">
                                        <label for="antes" class="form-check-label">Antes de una tarea</label>
                                        <input id="idAnterior" name="idAnterior" type="text" class="form-control" placeholder="ID anterior">
                                    </div>

                                    <div class="form-check">
                                        <input type="radio" name="posicion" id="despues" value="despues" class="form-check-input">
                                        <label for="despues" class="form-check-label">Después de una tarea</label>
                                        <input id="idSiguiente" name="idSiguiente" type="text" class="form-control" placeholder="ID siguiente">
                                    </div>

                                    <div class="form-check">
                                        <input type="radio" name="posicion" id="final" value="final" class="form-check-input">
                                        <label for="final" class="form-check-label">Al final</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-success" id="agregarTareaModalBtn">Agregar Tarea</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- tabla para visualizar las tareas agregadas --%>
                    <div class="col-lg-12 d-flex justify-content-center align-items-center">
                        <div>
                            <table id="tablaTarea" class="table table-striped" style="display:none;">
                            

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
                                        <td><%= tarea.getId() %></td>
                                        <td><%= tarea.getTitulo()%></td>
                                        <td><%= tarea.getDescripcion()%></td>
                                        <td><%= tarea.getFechaVencimiento()%></td>
                                        <td>
                                            <button class="btn btn-primary"  onclick="editarTarea('<%= tarea.getId()%>', '<%= tarea.getTitulo()%>', '<%= tarea.getDescripcion()%>', '<%= tarea.getFechaVencimiento()%>')"
                                                    data-bs-toggle="modal" data-bs-target="#editModalConfirm">
                                                Editar
                                            </button>

                                            <button class="btn btn-danger" onclick="eliminarTarea('<%= tarea.getTitulo()%>')">Eliminar</button>

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
        </div>
                                
        <section>


            <!-- Modal para editar información de la tarea -->
            <div class="modal fade" id="editModalConfirm" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog d-flex justify-content-start modal-dialog-centered modal-lg" style="margin-left: auto;">
                    <div class="modal-content custom-modal">

                        <div class="modal-body">
                            <!-- Contenido del modal -->

                            <form action="/mavenproject1/SvEditar"  method="POST"  >

                                <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel">Editar Información de la Tarea de con ID: <input type="text" class="form-control" id="id" name="id"  readonly style="border: none; background: none;" readonly> </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                                </div>

                                <div class="mb-3">
                                    <label for="titulo" class="form-label">Título</label>
                                    <input type="text" class="form-control" id="titulo" name="titulo">
                                </div>
                                <div class="mb-3">
                                    <label for="descripcion" class="form-label">Descripción</label>
                                    <input type="text" class="form-control" id="descripcion" name="descripcion">
                                </div>
                                <div class="mb-3">
                                    <label for="fecha" class="form-label">Fecha de vencimiento</label>
                                    <input type="date" class="form-control" id="fecha" name="fecha">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-success" id="guardarCambios">Guardar Cambios</button>
                                </div>
                            </form>


                        </div>
     
                    </div>
                </div>
            </div>

        </section>                
                        
                                
                                
        <%--Script para mostrar formulario tarea --%>                     
        <script>
                document.getElementById("mostrarFormulario").addEventListener("click", function() {
                var formulario = document.getElementById("formularioTarea");
                var tabla = document.getElementById("tablaTarea");
            if (formulario.style.display === "none" || formulario.style.display === "") {
                formulario.style.display = "block";
                tabla.style.display = "none";
                document.getElementById("formularioActual").value = "tarea"; // Agregar esta línea
            } else {
                formulario.style.display = "none";
            }
        });
                <%--Script para mostrar tabla tarea --%>  
                document.getElementById("mostrarTarea").addEventListener("click", function() {
                var formulario = document.getElementById("tablaTarea");
                var tarea = document.getElementById("formularioTarea");
            if (formulario.style.display === "none" || formulario.style.display === "") {
                formulario.style.display = "block";
                tarea.style.display = "none";
                document.getElementById("formularioActual").value = "tabla"; // Agregar esta línea
            } else {
                formulario.style.display = "none";
            }
       });
        </script>
        <%@include file="/templates/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                                function editarTarea(id, titulo, descripcion, fechaVencimiento) {


                                                    // Accede a los datos de la tarea
                                                    console.log("ID de la tarea: " + id);
                                                    console.log("Título de la tarea: " + titulo);
                                                    console.log("Descripción de la tarea: " + fechaVencimiento);
                                                    // ... otros métodos y propiedades de la tarea

                                                    // Luego, puedes usar estos datos para llenar el modal
                                                    document.getElementById('id').value = id;
                                                    document.getElementById('titulo').value = titulo;
                                                    document.getElementById('descripcion').value = descripcion;
                                                    document.getElementById('fecha').value = fechaVencimiento;
                                                    // ... otros campos del modal
                                                }



                                                function eliminarTarea(titulo) {

                                                    var confirmar = confirm('¿Estás seguro de que deseas eliminar la tarea con ID ' + titulo + '?');

                                                    if (confirmar) {


                                                        $.ajax({

                                                            url: '/mavenproject1/SvEliminarTarea?titulo=' + titulo,

                                                            method: 'POST',

                                                            success: function () {
                                                                console.log("Aqui estoy");
                                                                window.location.href = '/mavenproject1/templates/listas.jsp';
                                                            },
                                                            error: function () {
                                                                console.log("paila");
                                                            }
                                                        });
                                                        alert('Tarea eliminada con exito');

                                                    }
                                                }
        </script>


    </body>
</html>

