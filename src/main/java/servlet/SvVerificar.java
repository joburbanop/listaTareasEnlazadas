/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import com.umariana.mavenproject1.ControlUsuario;
import com.umariana.mavenproject1.Usurios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author danie
 */
@WebServlet(name = "SvVerificar", urlPatterns = {"/SvVerificar"})
public class SvVerificar extends HttpServlet {


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
                ServletContext context = getServletContext();
                String nombre= request.getParameter("usuario");
                String contrasenia = request.getParameter("contrasenia");
                String nombreUsuario = ControlUsuario.verificarUsuarioCreado(nombre, contrasenia, context);
                
                   if(nombreUsuario!=null){
                       System.out.println("aqui estoy ");
                       String script = "<script>alert('Se verificó correctamente.'); window.location.href = 'templates/listas.jsp?nombre_usuario=" + nombreUsuario + "';</script>";
                       response.setContentType("text/html");
                       response.getWriter().write(script);
                   }else{
                       System.out.println("usuario incorrecto");
                       String script = "<script>alert('Usuario incorrecto'); window.location.href = 'index.jsp?nombre_usuario=" + nombreUsuario + "';</script>";
                       response.setContentType("text/html");
                       response.getWriter().write(script);
                     //  request.getRequestDispatcher("index.jsp").forward(request, response);
                   }
              
                
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
