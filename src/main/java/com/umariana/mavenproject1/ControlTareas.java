/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.mavenproject1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;


public class ControlTareas {
    /*-------------------------------------------------------------
    *Atributos
    *--------------------------------------------*/
    public static Tarea cabeza; 
    private static List<Tarea> tareasUsuario = new ArrayList<>();
    
    public ControlTareas() {
        cabeza = null;
    }

    
    public void agregarTarea(Tarea nuevaTarea) {
        if (cabeza == null) {
            cabeza = nuevaTarea;
        } else {
            Tarea actual = cabeza;
            while (actual.getSiguiente() != null) {
                actual = actual.getSiguiente();
            }
            actual.setSiguiente(nuevaTarea);
        }
    }

 
    public Tarea buscarTareaPorTitulo(String titulo) {
        Tarea actual = cabeza;
        while (actual != null) {
            if (actual.getTitulo().equals(titulo)) {
                return actual;
            }
            actual = actual.getSiguiente();
        }
        return null; 
    }

   
    public static void eliminarArchivo(ServletContext context, String nombreUsuario){
        String relativePath = "/data/tareas_" + nombreUsuario + ".txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);
        
        
            
            try (BufferedWriter escribir = new BufferedWriter(new FileWriter(archivoCargar))) {
                System.out.println("aqui");
                escribir.write("");
                escribir.close();
            }
         catch (IOException e) {
             
            e.printStackTrace();
        }
    
    }
    
    public static void eliminarTareaPorTitulo(String titulo, ServletContext context, String nombreUsuario) {
        //List<Tarea> cargar =cargarTareasDesdeArchivo(context, nombreUsuario);
        
        tareasUsuario.remove(titulo);
        
        //eliminarArchivo(context,nombreUsuario);
    
        //cargarTareasDesdeArchivo(context, nombreUsuario);
        
        if (cabeza == null) {
            return; 
        }

        if (cabeza.getTitulo().equals(titulo)){
            cabeza = cabeza.getSiguiente();
            return; 
        }

        Tarea actual = cabeza;
        while (actual.getSiguiente() != null) {
            if (actual.getSiguiente().getTitulo().equals(titulo)) {
                actual.setSiguiente(actual.getSiguiente().getSiguiente());
                return;
            }
            actual = actual.getSiguiente();
        }
    }

  
    
    /**
     * Metodo para guardar informacion en un arvhibo de texto
     * @param nombreArchivo 
     */
    public static void guardarTareasEnArchivo(ServletContext context, List<Tarea> tareas, Usurios usuarioActivo) {
        
        String relativePath = "/data/tareas_" + usuarioActivo.getNombre_usuario() + ".txt";
        String absPath = context.getRealPath(relativePath);
        
        File archivoGuardar = new File(absPath);

        try {
            BufferedWriter escritor = new BufferedWriter(new FileWriter(archivoGuardar));

            for (Tarea tarea : tareas) {
                escritor.write("ID: " + tarea.getId());
                escritor.newLine();
                escritor.write("Título: " + tarea.getTitulo());
                escritor.newLine();
                escritor.write("Descripción: " + tarea.getDescripcion());
                escritor.newLine();
                escritor.write("Fecha de vencimiento: " + tarea.getFechaVencimiento());
                escritor.newLine();
                escritor.write("-----------------------");
                escritor.newLine();
            }

            escritor.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

   

    /**
     * Metodo para cargar 
     * @param nombreArchivo 
     */
    public static List<Tarea> cargarTareasDesdeArchivo(ServletContext context, String nombreUsuario) {
        
        tareasUsuario.clear();
        String relativePath = "/data/tareas_" + nombreUsuario + ".txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);
        boolean ve=archivoCargar.length() != 0;
        System.out.println("desde cargata: "+relativePath+ " vetificando si tiene contenido: "+ve);

        if (archivoCargar.length() != 0) {
            try (BufferedReader leyendo = new BufferedReader(new FileReader(archivoCargar))) {
                String id = null;
                String titulo = null;
                String descripcion = null;
                String fechaVencimiento = null;

                String lineaPorLinea;
                while ((lineaPorLinea = leyendo.readLine()) != null) {
                    if (lineaPorLinea.startsWith("ID:")) {
                        id = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Título:")) {
                        titulo = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Descripción:")) {
                        descripcion = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();
                    } else if (lineaPorLinea.startsWith("Fecha de vencimiento:")) {
                        fechaVencimiento = lineaPorLinea.substring(lineaPorLinea.indexOf(":") + 1).trim();

                        // Crea una nueva tarea y agrégala a la lista de tareas del usuario
                        Tarea nuevaTarea = new Tarea(id, titulo, descripcion, fechaVencimiento);
                        System.out.println("se creo nueva tarea: "+nuevaTarea.getFechaVencimiento());
                        tareasUsuario.add(nuevaTarea);

                        // Restablece las variables para la siguiente tarea
                        id = null;
                        titulo = null;
                        descripcion = null;
                        fechaVencimiento = null;
                    }
                }
            } catch (Exception e) {
                e.getMessage();
            }
        }
        return tareasUsuario;
    }

    
}
