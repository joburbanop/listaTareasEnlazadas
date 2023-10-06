
package com.umariana.mavenproject1;



public class Usurios {
      
    /*-------------------------------------------------------
     * Atributos 
     *-------------------------------------------------*/
    
     private String cedula;
     private String nombre_usuario;
     private String contrasenia;
 
 
     
     /*----------------------------------------------------------
      * Metodos
      *---------------------------------------------------------*/

     public Usurios(String cedula, String nombre_usuario, String contrasenia) {
        this.cedula = cedula;
        this.nombre_usuario = nombre_usuario;
        this.contrasenia = contrasenia;
    }


    public String getCedula() {
         return cedula;
     }
    public void setCedula(String cedula) {
         this.cedula = cedula;
     }
     public String getNombre_usuario() {
         return nombre_usuario;
     }
     public void setNombre_usuario(String nombre_usuario) {
         this.nombre_usuario = nombre_usuario;
     }
     public String getContrasenia() {
         return contrasenia;
     }
     public void setContrasenia(String contrasenia) {
         this.contrasenia = contrasenia;
     }
 
 
}
