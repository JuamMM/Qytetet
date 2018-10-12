/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloqytetet;

/**
 *
 * @author joseng2709
 */
public class Jugador {
   private Boolean encarcelado;
   private String nombre;
   private int saldo;
  
   public Jugador(String nombre){
       encarcelado=false;
       this.nombre=nombre;
       saldo=7500;
   }
    
   public Boolean cancelarHipoteca(TituloPropiedad titulo){}
   
   public Boolean comprarTitulPropiedad(){}
   
   public int cuantasCasasHotelesTengo(){}
   
   public Boolean deboPagarAlquiler(){}
   
   public Sorpresa devolverCartaLibertad(){}
   
   public Boolean edificarCasa(TituloPropiedad titulo){}
   
   public Boolean edificarHotel(TituloPropiedad titulo){}
   
   private void eliminarDeMisPropiedades(){}
   
   private Boolean esDeMiPropiedad(TituloPropiedad titulo){}
   
   public Boolean estoyEnCalleLibre(){}
   
   public Sorpresa getCartaLibertad(){}
   
   public Casilla getCasillaActual(){}
   
   public Boolean getEncarcelado(){}
   
   public String getNombre(){
       return nombre;
   }
   
   public ArrayList<TituloPropiedad> getPropiedades(){}
   
   public 
   
   
   
}
