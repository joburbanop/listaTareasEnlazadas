
package com.umariana.mavenproject1;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;



public class ControlUsuario {

    /*---------------------------------------------------------
     * Metodos
    *----------------------------------------------------- */
    private  static ArrayList<Usurios> usuriosNuevo= new ArrayList<>();
  



    public static void guardarUsuarios( ArrayList<Usurios> UsuarioIngresar) throws IOException{
        File archivoGuardar = new File("./data/usuarios.txt");
        PrintWriter escribir = new PrintWriter(new FileWriter(archivoGuardar, true));

        //verficamos si existe contenido dentro del arichvo p
        if (archivoGuardar.exists() && archivoGuardar.length()<=0) {
            escribir.println("====usuarios registrados");
        } else {
            for (Usurios usurios : UsuarioIngresar) {
                escribir.println("nombre: " + usurios.getNombre_usuario());
                escribir.println("cedula: " +usurios.getCedula());
                escribir.println("contraseña: "+ usurios.getContrasenia());
            }
        }
   
    }

    public static void cargarArchivo(){
        File archivoAcargar = new File("./data/usuarios.txt");

        if (archivoAcargar.length()!=0) {
            try (BufferedReader leyendo = new BufferedReader(new FileReader(archivoAcargar)) ) {
                String nomreUsurio= null;
                String cedula=null;
                String contrasenia=null;
                 
                String lineaPorlinea;
                while ((lineaPorlinea = leyendo.readLine()) != null) {
                    if (lineaPorlinea.startsWith("nombre:")) {
                        nomreUsurio = lineaPorlinea.substring(lineaPorlinea.indexOf(":") + 1).trim();
                    } else if (lineaPorlinea.startsWith("cedula:")) {
                        cedula = lineaPorlinea.substring(lineaPorlinea.indexOf(":") + 1).trim();
                    } else if (lineaPorlinea.startsWith("contraseña:")) {
                        contrasenia = lineaPorlinea.substring(lineaPorlinea.indexOf(":") + 1).trim();

                        // Crea un nuevo usuario y agrégalo a la lista de usuarios
                        Usurios nuevoUsuario = new Usurios(cedula, nomreUsurio, contrasenia);
                        usuriosNuevo.add(nuevoUsuario);

                        // Restablece las variables para el siguiente usuario
                        nomreUsurio = null;
                        cedula = null;
                        contrasenia = null;
                    }
                
            }
         } catch (Exception e) {

                e.getMessage();
            }
        }
    }


    public static boolean verificarUsuarioCreado(String nombre, String contrasenia) throws IOException {

        cargarArchivo();
        
       for (Usurios IUsuarios : usuriosNuevo) {
            if (IUsuarios.getNombre_usuario().equals(nombre) && IUsuarios.getContrasenia().equals(contrasenia)) {
                return true;
            }
       }
       return false;
}
}
