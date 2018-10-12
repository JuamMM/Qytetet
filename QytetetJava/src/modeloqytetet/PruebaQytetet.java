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
public class PruebaQytetet {
    
    static private Qytetet juego = new Qytetet();
    static private ArrayList<Sorpresa> mazo;
    
    public static void main(String[] args) {
        ArrayList <Sorpresa> mazo = new ArrayList <>();
        
        juego.inicializarCartasSorpresa();
        
        System.out.print(juego.getMazo().toString());
        
        System.out.print(juego.getTablero().toString());
    }
    
}
