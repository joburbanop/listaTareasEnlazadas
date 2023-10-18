<%-- 
    Document   : listas
    Created on : 10 oct 2023, 16:41:28
    Author     : danie
--%>

<%@page import="com.umariana.mavenproject1.ControlUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.umariana.mavenproject1.Usurios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@include file="/templates/header.jsp" %>
<%
           ServletContext context = request.getServletContext();            
           String nombre = request.getParameter("nombre_usuario");          
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>style
<section class="vh-100" style="background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));">
    <div class="container p-4"> <!-- clase contenedora -->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: white;">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="#" style="color: black;">
                    <i class="fas fa-cubes fa-2x me-3" style="color: lightblue;"></i>
                    <span style="line-height: 1.2;">#######</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: black;">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class "nav-link" href="#" style="color: black;">Tareas</a>
                        </li>
                    </ul>
                    <div class="navbar-text text-center" style="color: black;">
                        Hola, <%= nombre%>!
                    </div>
                    <a href="../index.jsp" class="btn btn-warning" style="background-color: lightblue; border-color: lightblue; color: black;">Cerrar Sesión</a>
                </div>
            </div>
        </nav>

        <%-- formulario para agregar tareas --%>
        <h1 class="text-center mt-4 mb-4" style="color: black;">Tareas</h1>
        <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center"> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                <div class="card card-body text-center" style="background-color: white; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                    <h4 class="text-center" style="color: black;">Agrega tareas</h4>
                    <form action="SvTarea" method="POST">
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

                        <div class "input-group mb-3">
                            <label class="input-group-text" for="raza">Fecha de vencimiento</label>
                            <input type="date" name="fechav" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary" style="background-color: lightblue; border-color: lightblue;">Agregar tarea</button>
                    </form>
                </div>
            </div>

            <%-- tabla para visualizar las tareas agregadas --%>
            <div class="col-md-8">
                <div>
                    <table class="table table-bordered" style="background-color: white; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); color: black;">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Titulo</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Fecha de vencimiento</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody style="background-color: white;">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>  
        </div>
    </div>
</section>
<%@include file="/templates/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

