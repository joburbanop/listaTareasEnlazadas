/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import com.umariana.mavenproject1.ControlUsuario;
import com.umariana.mavenproject1.Usurios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jonathan
 */
@WebServlet(name = "SvRegistrar", urlPatterns = {"/SvRegistrar"})
public class SvRegistrar extends HttpServlet {
    
    ArrayList<Usurios> UsuarioIngresar= new ArrayList<>();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
                String cedula = request.getParameter("cedula");
                String nombre= request.getParameter("nombre_usuario");
                String contrasenia = request.getParameter("contrasenia");
                ServletContext context= getServletContext();
                Usurios usuario = new Usurios(cedula, nombre, contrasenia);
                UsuarioIngresar.add(usuario);
                
                System.out.println("si se pudo "+nombre + cedula );
        
                
                ControlUsuario.guardarUsuarios(UsuarioIngresar , context);
                  
                if (ControlUsuario.cerificarUsuarioRegistrado(nombre, contrasenia, context)) {

            String errorMessage = "El usuario ya está registrado.";

            String script = "<script>alert('" + errorMessage + "'); window.location.href = 'index.jsp';</script>";
            response.setContentType("text/html");
            response.getWriter().write(script);
        } else {

            Usurios nuevoUsuario = new Usurios(cedula, nombre, contrasenia);
            UsuarioIngresar.add(nuevoUsuario);
            ControlUsuario.guardarUsuarios(UsuarioIngresar, context);
            String nombreUsuario = nuevoUsuario.getNombre_usuario();
            String script = "<script>alert('Se ha registrado exitosamente.'); window.location.href = 'index.jsp?nombreUsuario=" + nombreUsuario + "';</script>";
            response.setContentType("text/html");
            response.getWriter().write(script);
        }
                // Redirigir a la página index.jsp
                request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
