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
    
   //Boolean cancelarHipoteca(TituloPropiedad titulo){}
   
   //Boolean comprarTitulPropiedad(){}
   
   //int cuantasCasasHotelesTengo(){}
   
   //Boolean deboPagarAlquiler(){}
   
   //Sorpresa devolverCartaLibertad(){}
   
   //Boolean edificarCasa(TituloPropiedad titulo){}
   
   //Boolean edificarHotel(TituloPropiedad titulo){}
   
   //private void eliminarDeMisPropiedades(){}
   
   //private Boolean esDeMiPropiedad(TituloPropiedad titulo){}
   
   //Boolean estoyEnCalleLibre(){}
   
   Sorpresa getCartaLibertad(){
       
   }
   
   Casilla getCasillaActual(){}
   
   Boolean getEncarcelado(){
       return encarcelado;
   }
   
   public String getNombre(){
       return nombre;
   }
   
   public ArrayList<TituloPropiedad> getPropiedades(){
       for(int i=0;i<)
   }
   
   public int getSaldo(){
       return saldo;
   }
   
   //Boolean hipotecarPropiedad(TituloPropiedad titulo){}
   
   //void irACarcel(Casilla casilla){}
   
   //int modificarSaldo(int cantidad){}
   
   //int obtenerCapital(){}
   
   //ArrayList<TituloPropiedad> obtenerPropiedades(Boolean hipotecada){}
   
   //void pagarAlquiler(){}
   
   //void pagarImpuesto(){}
   
   //void pagarLibertad(int  cantidad){}
   
   //void setAttribute(attribute){}
   
   void setCartaLibertad(Sorpresa carta){}
   
   void setCasilla(Casilla casilla){}
   
   void setEncarcelado(Boolean encarcelado){
       this.encarcelado=encarcelado;
   }
   
   void setEncarceladoSinPoderSalir(Boolean encarceladoSinPoderSalir){}
   
   public void setHaTiradoDado(Boolean haTiradoDado){}
   
   void setSaldo(int saldo){
       this.saldo=saldo;
   }
   
   //Boolean tengoCartaLibertad(){}
   
   //private Boolean tengoSaldo(int cantidad){}
   
   //Boolean venderPropiedad(Casilla casilla){}
   
   
}
