
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet"  href="static/css/style.css"><link>
        <title>JSP Page</title>
    </head>
    <body>

        <section>
            
            <%@include file="templates/header.jsp"%>
        </section>
            <%
                String relativePath = getServletContext().getRealPath("/data");
               String archivoGuardar = "usuarios.txt";
               
               File data = new File(relativePath);
               File archivo = new File(data + "/" + archivoGuardar);   
               data.mkdir();
               archivo.createNewFile();
            %>
        
        <section class="vh-100 gradient-custom">
          <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
              <div class="col-12 col-md-12 col-lg-8 col-xl-7">
                <div class="card bg-dark text-white" style="border-radius: 1rem;">
                  <div class="card-body p-5 pt-2 text-center" >
                    <div class="mb-md-5 mt-md-4 py-0">
                      <h2 class="fw-bold mb-2 text-uppercase">Bienvenidos</h2>
                      <p class="text-white-50 mb-3">Por favor ingrese usuario y contraseña</p>
                      
                      <form action="SvVerificar" method="POST">
                        <div class="form-outline form-white mb-3">
                          <input type="text" name = "usuario" id="typeEmailX" class="form-control form-control-lg"  required/>
                          <label class="form-label" for="text">Nombre de Usuario</label>
                        </div>

                        <div class="form-outline form-white mb-2">
                          <input type="password" name="contrasenia" id="typePasswordX" class="form-control form-control-lg" required />
                          <label class="form-label" for="typePasswordX">Contraseña</label>
                        </div>

                        <p class="small mb-4 pb-lg-2"><a class="text-white-50" href="#!">¿Olvidó su contraseña?</a></p>
                        <button class="btn btn-outline-light btn-lg px-5" type="submit">Ingresar</button>
                        
                      </form>

                    </div>

                    <div>
                      <p class="mb-0">¿No tiene cuenta? <a href="templates/registrar.jsp" class="text-white-50 fw-bold">Registrar</a></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

            
       
        
        <section>
            <%@include file="templates/footer.jsp"%>
            
        </section>
        
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        <script src="static/script/verificar.js"></script>
    </body>
</html>
