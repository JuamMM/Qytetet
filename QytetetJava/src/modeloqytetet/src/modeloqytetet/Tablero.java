/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloqytetet;

import java.util.ArrayList;
/**
 *
 * @author joseng2709
 */
public class Tablero {
   private Casilla carcel;
   private ArrayList<Casilla> casillas=new ArrayList<>() ;

   public Tablero(){
       inicializar();
   }
   public Casilla getCasillaCarcel(){
       return carcel;
   }
   
   public ArrayList<Casilla> getPropiedades(){
       return casillas;
   }
 
   @Override        
   public String toString(){
       return "Casillas = " + casillas.toString() + "\t Cárcel = " + carcel.toString() + "\n";        
   }
   private void inicializar(){
        casillas = new ArrayList<Casilla>();
        casillas.add(new Casilla(TipoCasilla.SALIDA,0)); // Casilla de salida
        casillas.add(new Casilla(TipoCasilla.PARKING,10)); // Parking
        casillas.add(new Casilla(TipoCasilla.IMPUESTO,3)); // Impuesto
        casillas.add(new Casilla(TipoCasilla.JUEZ,15)); // Juez
        
        casillas.add(new Casilla(TipoCasilla.SORPRESA,7));
        casillas.add(new Casilla(TipoCasilla.SORPRESA,13));
        casillas.add(new Casilla(TipoCasilla.SORPRESA,17));
        
        casillas.add(new Casilla(TipoCasilla.CALLE,1,new TituloPropiedad("Lecho de Pulgas",false,50,10,1.10f,25,30,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,2,new TituloPropiedad("Llanuras Dothraki",false,100,25,1.10f,50,30,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,4,new TituloPropiedad("Mas alla del muro", false,150,40,1.10f,75,30,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,6,new TituloPropiedad("Nido de Aguila",false,200,55,1.25f,100,60,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,8,new TituloPropiedad("Bahia de Esclavos", false,250,70,1.25f,125,60,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,9,new TituloPropiedad("El Muro",false,300,95,1.25f,150,60,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,11,new TituloPropiedad("Antigua",false,350,110,1.25f,175,90,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,12,new TituloPropiedad("Dorne",false,400,125,1.25f,200,90,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,14,new TituloPropiedad("Invernalia",false,450,140,1.35f,225,90,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,16,new TituloPropiedad("Rocadragon",false,500,165,1.35f,250,120,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,18,new TituloPropiedad("Bravos",false,550,170,1.35f,275,120,0,0)));
        casillas.add(new Casilla(TipoCasilla.CALLE,19,new TituloPropiedad("Desembarco del rey",false,600,200,1.50f,300,180,0,0)));
        
        carcel = new Casilla(casillas.get(4).getTipo(),casillas.get(4).getNumeroCasilla());
    }
   
    Boolean esCasillaCarcel(int numeroCasilla){
        if (numeroCasilla == 5)
            return true;
        else
            return false;
    }
    
    public Casilla obtenerCasillaNumero(int numeroCasilla){
        return casillas.get(numeroCasilla);
    }
   
    Casilla obtenerCasillaFinal(Casilla casilla,int desplazamiento){
        int suma=0;
        suma+= casilla.getNumeroCasilla();
        if(suma > 19){
               suma -= 20;       
        }
       return casillas.get( suma );
    }
}
   
