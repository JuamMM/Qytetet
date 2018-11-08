package modeloqytetet;

import java.util.ArrayList;
        
        
public class Jugador implements Comparable {
   private Boolean encarcelado;
   private String nombre;
   private int saldo;
   private Casilla casillaActual;
   private Sorpresa cartaLibertad;
   private ArrayList<TituloPropiedad> propiedades;
   
  
   public Jugador(String nombre){
       encarcelado=false;
       this.nombre=nombre;
       saldo=7500;
       this.cartaLibertad = null;
       this.casillaActual = null;
       this.propiedades = new ArrayList<TituloPropiedad>();
   }
   
    @Override
    public int compareTo(Object otroJugador) {
        int otroCapital = ((Jugador) otroJugador).obtenerCapital();
        return otroCapital - obtenerCapital();
    }

   @Override
     public String toString(){
         String propiedadesJugador ="";
         for(int i=0;i<this.propiedades.size();i++){
                               propiedadesJugador+= this.propiedades.get(i).toString()+"\n";
         }
         if (this.propiedades.size()==0){
            return "Nombre: "+this.nombre + "\n"+
                   "Saldo: "+this.saldo + "\n"+
                   "Capital: "+obtenerCapital() +"\n"+
                   "Encarcelado: "+ this.encarcelado + "\n"+
                   "CasillaActual: "+this.casillaActual +"\n"+
                   "CartaLibertad: "+this.cartaLibertad +"\n";
                    
         }else
             return "Nombre: "+this.nombre + "\n"+
                    "Saldo: "+this.saldo + "\n"+
                    "Capital: "+obtenerCapital() +"\n"+
                    "Encarcelado: "+ this.encarcelado + "\n"+
                    "CasillaActual: "+this.casillaActual +"\n"+
                    "CartaLibertad: "+this.cartaLibertad +"\n"+
                    "Propiedades: "+ propiedadesJugador + "\n";
                 
                
     }
    
   //Boolean cancelarHipoteca(TituloPropiedad titulo){}
   
   //Boolean comprarTitulPropiedad(){}
   
   int cuantasCasasHotelesTengo(){
       int sumaHotelesCasas=0;
       for(int i=0; i< this.propiedades.size();i++){
           sumaHotelesCasas += this.propiedades.get(i).getNumCasas();
           sumaHotelesCasas +=this.propiedades.get(i).getNumHoteles();
        }
        return sumaHotelesCasas;
   }
   
   //Boolean deboPagarAlquiler(){}
   
   Sorpresa devolverCartaLibertad(){
       Sorpresa libertadTemporal;
       libertadTemporal=new Sorpresa(cartaLibertad.getTexto(),
               cartaLibertad.getValor(),cartaLibertad.getTipoSorpresa());
       
       cartaLibertad=null;
       
       return libertadTemporal;
   }
   
   Boolean edificarCasa(TituloPropiedad titulo){
        int numcasas=titulo.getNumCasas();
        Boolean devolver=false;
        if(titulo.getPropietario().esDeMiPropiedad(titulo)==true){
            if(numcasas<4){
                titulo.setCasas(numcasas+1);
                devolver=true;
            }
        }
        return devolver;
   }
   
   Boolean edificarHotel(TituloPropiedad titulo){
       int numcasas=titulo.getNumCasas();
       int numhoteles=titulo.getNumHoteles();
       Boolean devolver=false;
       
       if(titulo.getPropietario().esDeMiPropiedad(titulo)==true){
           if(numcasas==4){
               titulo.setCasas(0);
               titulo.setHoteles(1);
               devolver=true;
           }
       }
       return devolver;
   }
   
   //private void eliminarDeMisPropiedades(){}
   
   protected Boolean esDeMiPropiedad(TituloPropiedad titulo){
       Boolean encontrado=false;
       
       for(int i=0;i<this.propiedades.size() && encontrado==false ;i++){
           if(this.propiedades.get(i).getNombre() == titulo.getNombre()){
               encontrado=true;
           }
       }
       return encontrado;
   }
   
   Boolean estoyEnCalleLibre(){
        Boolean devolver=true;
        
        if(casillaActual.getTituloPropiedad().tengoPropietario()==true)
            devolver=false;
        
        return devolver;
   }
   
   Sorpresa getCartaLibertad(){
        return cartaLibertad;
   }
   
   Casilla getCasillaActual(){
       return this.casillaActual;
   }
   
   Boolean getEncarcelado(){
       return encarcelado;
   }
   
   public String getNombre(){
       return nombre;
   }
   
   public ArrayList<TituloPropiedad> getPropiedades(){
       return propiedades;
   }
   
   public int getSaldo(){
       return saldo;
   }
   
   Boolean hipotecarPropiedad(TituloPropiedad titulo){
       Boolean hipotecado=false;
       if(this.esDeMiPropiedad(titulo)==true){
           if(titulo.getHipotecada()==false){
               titulo.cambiaHipotecada();
               hipotecado=true;
            }
       }
       return hipotecado;
   }
   
   //void irACarcel(Casilla casilla){}
   
   int modificarSaldo(int cantidad){
       this.saldo-=cantidad;
       return saldo;
}
   
   int obtenerCapital(){
        int capital = this.saldo;
            for(int  i = 0; i < this.propiedades.size(); i++){
                int precioEdificarHotelyCasa = this.propiedades.get(i).getPrecioEdificar();
                int costeBase = this.propiedades.get(i).getPrecioCompra();
                int numCasas = this.propiedades.get(i).getNumCasas();
                int numHoteles = this.propiedades.get(i).getNumHoteles();
  
                if(!this.propiedades.get(i).getHipotecada()){
                    capital += costeBase * (numCasas + numHoteles);
                }else{
                    capital -= costeBase * (numCasas + numHoteles);
            }
        }
        
        return capital;
   }
   
   ArrayList<TituloPropiedad> obtenerPropiedades(Boolean estadoHipoteca){
       
       ArrayList<TituloPropiedad> hipotecadas = new ArrayList<TituloPropiedad>();
       ArrayList<TituloPropiedad> noHipotecadas = new ArrayList<TituloPropiedad>(); 
        
       for(int i = 0; i < this.propiedades.size(); i++){
            if(this.propiedades.get(i).getHipotecada() == true)
                hipotecadas.add(this.propiedades.get(i));
            else
                noHipotecadas.add(this.propiedades.get(i));
}
       if(estadoHipoteca == true)
           return hipotecadas;
       else
           return noHipotecadas;
       
   }
   
   //void pagarAlquiler(){}
   
   void pagarImpuesto(){
       saldo -= casillaActual.getCoste();
    }
   
   void pagarLibertad(int  cantidad){
       if(encarcelado == true)
           if(this.saldo>=cantidad);
               this.setSaldo(saldo-cantidad);
   }
   
   //void setAttribute(attribute){}
   
   void setCartaLibertad(Sorpresa carta){
       this.cartaLibertad=carta;
   }
   
   void setCasillaActual(Casilla casilla){
       this.casillaActual = casilla;
   }
   
   void setEncarcelado(Boolean encarcelado){
       this.encarcelado=encarcelado;
   }

   
   void setSaldo(int saldo){
       this.saldo=saldo;
   }
   
   Boolean tengoCartaLibertad(){
       if(cartaLibertad != null){
           return true;
       }else
           return false;
   }
   
   private Boolean tengoSaldo(int cantidad){
       if(saldo >= cantidad)
           return true;
       else 
           return false;
   }
   
   Boolean venderPropiedad(Casilla casilla){
       int numerocasilla=casilla.getNumeroCasilla();
       Boolean devolver=false;
       if(this.esDeMiPropiedad(this.propiedades.get(numerocasilla))==true){
           this.getPropiedades().remove(numerocasilla);
           this.setSaldo(this.getPropiedades().get(numerocasilla).getPrecioCompra());
           devolver=true;
       }  
       return devolver;    
   }
   
   
}
