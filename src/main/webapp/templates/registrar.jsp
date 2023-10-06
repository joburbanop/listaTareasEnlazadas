
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet"  href="../static/css/estylosRegistro.css"><link>
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <section>
            
            <form action="SvCrearUsuarios" method="GET">
            <!-- Form-->
            <div class="form">
              <div class="form-toggle"></div>
              
              <div class="form-panel one">
                <div class="form-header">
                  <h1>Nuevo usuario</h1>
                </div>
                <div class="form-content">
                  
                      
                      <div class="form-group">
                      <label for="username">Cedula</label>
                      <input id="username" type="text" name="cedula" required="required">
                    </div>
                      
                    <div class="form-group">
                      <label for="username">Nombre de Usuario</label>
                      <input id="username" type="text" name="nombre_usuario" required="required">
                    </div>
                    <div class="form-group">
                      <label for="password">Contraseña</label>
                      <input id="password" type="password" name="contrasenia" required="required">
                    </div>
                    
                    <div class="form-group">
                      <button type="submit">Iniciar seccion</button>
                    </div>
                
                </div>
              
            </div>
        </form>
            
            
        </section>
        
        
        
    </body>
</html>
