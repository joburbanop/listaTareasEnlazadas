
package servlet;

import com.umariana.mavenproject1.ControlTareas;
import com.umariana.mavenproject1.ControlUsuario;
import com.umariana.mavenproject1.Tarea;
import com.umariana.mavenproject1.Usurios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author jonathan
 */
@WebServlet(name = "SvCrearTarea", urlPatterns = {"/SvCrearTarea"})
public class SvCrearTarea extends HttpServlet {

 
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
        
        HttpSession session = request.getSession(false);
        
        System.out.println("ya vamos agregar Tara:"+ session);
        
        ServletContext context= getServletContext();
       
        String nombreUsuario = (String) session.getAttribute("nombre_usuario");
        String cedulaUsuario = (String) session.getAttribute("cedula_usuario");
        
        Usurios usuarioActivo= ControlUsuario.obtenerUsuarioActivo(nombreUsuario, cedulaUsuario, context);
        System.out.println(usuarioActivo.getNombre_usuario());
        // Crea una nueva tarea y asóciala al usuario
        String id = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fecha = request.getParameter("fecha");
        session.setAttribute("tareas", usuarioActivo.obtenerTareas());
        Tarea nuevaTarea = new Tarea(id, titulo, descripcion, fecha);
        
        
                
        usuarioActivo.agregarTarea(nuevaTarea);
        ControlTareas.guardarTareasEnArchivo(context, usuarioActivo.obtenerTareas(), usuarioActivo.getNombre_usuario());
               
     
        response.sendRedirect("templates/listas.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    
 

    
}
