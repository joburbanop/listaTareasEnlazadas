
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet"  href="style.css"><link>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

        <title>login</title>
        
    </head>
    <body>

            <%
                String relativePath = getServletContext().getRealPath("/data");
               String archivoGuardar = "usuarios.txt";
               
               File data = new File(relativePath);
               File archivo = new File(data + "/" + archivoGuardar);   
               data.mkdir();
               archivo.createNewFile();
            %>
            
            
        
            <div class="container" id="container">
                    
                    <!--Formulario para crear cuenta redirije a SvRegistrar-->
                    <div class="form-container sign-up">
                        <form  action="SvRegistrar" method="POST">
                            <h1>Crea una cuenta</h1>
                            <input type="text" name="usuario" placeholder="Usuario">
                            <input type="text" name="cedula" placeholder="Cedula">
                            <input type="password" name="contrasenia" placeholder="Contraseña">
                            <input type="submit" value="Crear cuenta">
                        </form>
                    </div>

                    <!--Formulario para iniciar sesion redirije a SvVerificar-->
                    <div class="form-container sign-in">
                        <form action="SvVerificar" method="post">
                            <h1>Ingresa</h1>
                            <input type="text" name="email" placeholder="Usuario">
                            <input type="password" name="contra" placeholder="Contraseña">
                            <input type="submit" value="Ingresar">
                        </form>
                    </div>
                    <div class="toggle-container">
                        <div class="toggle">
                            <div class="toggle-panel toggle-left">
                                <h1>Si ya tienes una cuenta</h1>
                                <button class="hidden" id="login">Ingresa</button>
                            </div>
                            <div class="toggle-panel toggle-right">
                                <h1>Hola,nuevo Usuario!</h1>
                                <button class="hidden" id="register">Registrate</button>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="script.js"></script>
            </body>


</html>
