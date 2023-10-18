<%-- 
    Document   : iniciarTarea
    Created on : 18/10/2023, 10:46:02 a. m.
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
           ServletContext context = request.getServletContext();            
           String nombre = request.getParameter("nombre_usuario");          
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet"  href="static/css/inicioTareaStyle.css"><link>
        <title>JSP Page</title>
        <style>
            body{
                    /* fallback for old browsers */
            background: #6a11cb;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));
            
           color: white;
            }

</style>
    </head>
    <body>
        <section class="gradient-custom">
              
            <h1>Bienvenido, <%= nombre%>!</h1>
                 
            <div class="container">
            <h1>Agregar nuevo espacio de trabajo</h1>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="nombre">Nombre del espacio de trabajo:</label>
                        <input type="text" class="form-control" id="nombre">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="btn-group btn-group-toggle mt-3" data-toggle="buttons">
                        <label class="btn btn-secondary active">
                             <label for="nombre">Privacidad:</label>
                            <input type="radio" name="options" id="option1" autocomplete="off" checked> Abierto
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option2" autocomplete="off"> Cerrado
                        </label>
                    </div>
                </div>
            </div>
            <div>
            <button type="submit" class="btn btn-primary mt-3">Crear</button>
            </div>
        </div>
        
            
        </section>
        
           
  
          <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
</html>
