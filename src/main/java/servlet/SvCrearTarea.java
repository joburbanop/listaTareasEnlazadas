
package servlet;

import com.umariana.mavenproject1.ControlTareas;
import com.umariana.mavenproject1.Tarea;
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

        ServletContext context= getServletContext();
        String id = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fecha = request.getParameter("fecha");
        
        Tarea nuevaTarea = new Tarea(id, titulo, descripcion, fecha);
        
        ControlTareas controlTareas = new ControlTareas();
        
        controlTareas.agregarTarea(nuevaTarea);

        controlTareas.guardarTareasEnArchivo(context);

  
        response.sendRedirect("templates/listas.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
