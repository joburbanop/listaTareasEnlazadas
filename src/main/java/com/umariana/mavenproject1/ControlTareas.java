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
import javax.servlet.ServletContext;


public class ControlTareas {
    /*-------------------------------------------------------------
    *Atributos
    *--------------------------------------------*/
    private Tarea cabeza; 

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

   
    public void eliminarTareaPorTitulo(String titulo) {
        if (cabeza == null) {
            return; 
        }

        if (cabeza.getTitulo().equals(titulo)) {
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
    public void guardarTareasEnArchivo(ServletContext context) {
        
        String relativePath = "/data/tareas.txt";
        String absPath = context.getRealPath(relativePath);
        
        File archivoGuardar = new File(absPath);
        
        try {
            
            BufferedWriter escritor = new BufferedWriter(new FileWriter(archivoGuardar));

            Tarea actual = cabeza;
            while (actual != null) {
                escritor.write("ID: " + actual.getId());
                escritor.newLine();
                escritor.write("Título: " + actual.getTitulo());
                escritor.newLine();
                escritor.write("Descripción: " + actual.getDescripcion());
                escritor.newLine();
                escritor.write("Fecha de vencimiento: " + actual.getFechaVencimiento());
                escritor.newLine();
                escritor.write("-----------------------");
                escritor.newLine();
                actual = actual.getSiguiente();
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
    public  void cargarTareasDesdeArchivo(ServletContext context) {
        
        String relativePath = "/data/usuarios.txt";
        String absPath = context.getRealPath(relativePath);
        File archivoCargar = new File(absPath);
        try {
          
            BufferedReader lector = new BufferedReader(new FileReader(archivoCargar));

            String linea;
            while ((linea = lector.readLine()) != null) {
                String id = linea.substring(linea.indexOf(":") + 1).trim();
                String titulo = lector.readLine().substring(linea.indexOf(":") + 1).trim();
                String descripcion = lector.readLine().substring(linea.indexOf(":") + 1).trim();
                String fechaVencimiento = lector.readLine().substring(linea.indexOf(":") + 1).trim();
                lector.readLine(); // Salta la línea de separación

                Tarea nuevaTarea = new Tarea(id, titulo, descripcion, fechaVencimiento);
                agregarTarea(nuevaTarea);
            }

            lector.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    
}
