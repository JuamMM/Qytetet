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
public class Casilla {
   private int numeroCasilla;
   private int precioCompra;
   private TipoCasilla tipo;
   private TituloPropiedad titulo;
   
   public Casilla(TipoCasilla tipo,int numeroCasilla){
       this.tipo=tipo;
       this.numeroCasilla=numeroCasilla;
       precioCompra=0;
       this.titulo=new TituloPropiedad();
       
   }
   public Casilla(TipoCasilla tipo,int numeroCasilla,TituloPropiedad titulo){
       this.tipo=tipo;
       this.numeroCasilla=numeroCasilla;
       this.precioCompra=titulo.getPrecioCompra();
       setTitulo(titulo);
       
       
       
   }
  //TituloPropiedad asignarPropieterio(Jugador jugador){}
   
   public int getNumeroCasilla(){
       return numeroCasilla;
   }
   public int getCoste(){
       return precioCompra;
   }
   public TipoCasilla getTipo(){
       return tipo;
   }
   public TituloPropiedad getTituloPropiedad(){
       return titulo;
   }
   @Override
   public String toString(){
        String comun = "Numero casilla = " + this.numeroCasilla + "\t" +
            "Coste = " + this.titulo.getPrecioCompra() + "\t" + 
            "Numero Hoteles = " + this.titulo.getNumHoteles() + "\t" +
            "Numero Casas = " + this.titulo.getNumCasas() + "\t" +
            "Tipo = " + this.tipo.toString() + "\n\n";
        if(this.titulo != null){
            return comun +
                "Titulo = " + this.titulo.toString() + "\n";
        }else{
            return comun;
        }
        
   }
   
   //int pagarAlquiler(){}
   
   Boolean propietarioEncarcelado(){
       return titulo.propietarioEncarcelado();
   }
   
   private void setTitulo (TituloPropiedad titulo){
       this.titulo=titulo;
   }
   
   Boolean soyEdificable(){
       Boolean devolver;
       if(tipo == TipoCasilla.CALLE)
           devolver=true;
       else
           devolver=false;
       
       return devolver;
   }
   
   Boolean tengoPropietario(){
       return titulo.tengoPropietario();
   }
}
