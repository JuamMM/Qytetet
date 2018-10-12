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
public class Qytetet {
    
    private ArrayList<Sorpresa> mazo = new ArrayList<> ();
    private Tablero tablero;
    
    public Qytetet(){
        inicializarTablero();
    }
    public ArrayList getMazo(){
        return mazo;
    }
    
    private void inicializarTablero(){
        tablero = new Tablero();
    }
    
    void inicializarCartasSorpresa(){
        mazo.add (new Sorpresa ("Te han pillado robando comida en el Lecho de "
                + "Pulgas ,debes ir a las mazmorras de Desembarco del Rey.",tablero.getCasillaCarcel().getNumeroCasilla(),
                TipoSorpresa.IRACASILLA));
        mazo.add(new Sorpresa("Viajas al Muro porque quieres mear desde lo alto.",9,
                TipoSorpresa.IRACASILLA));
        mazo.add(new Sorpresa ("Viajas a Desembarco del rey, para reunirte con La"
                + "Mano",19,TipoSorpresa.IRACASILLA));
        mazo.add(new Sorpresa ("Los guardias de las mazmorras se han quedado "
                + " dormidos y consigues escapar,quedas libre de las mazmorras.",0,
                TipoSorpresa.SALIRCARCEL));
        mazo.add(new Sorpresa ("Caminas por el bosque y te encuentras a unos bandidos"
                + "y te amenazan con matarte, pierdes 500 monedas de oro.",-500,
                TipoSorpresa.PAGARCOBRAR));
        mazo.add(new Sorpresa ("Te encuentras una bolsa con oro, recibes 500",
                500,TipoSorpresa.PAGARCOBRAR));
        mazo.add(new Sorpresa ("Los saqueos han comenzado en las ciudades por escasez de"
                + "alimentos y los más pobres asaltan posadas y castillos. Tienes que"
                + "repararlos, pagas 50 monedas de oro por posada y 100 monedas de oro"
                + "por castillo.",-50*1-100*1,TipoSorpresa.PORCASAHOTEL));
        mazo.add(new Sorpresa("La gran gestion de La Mano(Tyrion Lannister) hace "
                + "que las posadas de todo el reino se llenen y los castillos vuelvan a "
                + "recuperar el honor de otras epocas, recibes 50 monedas de oro por posada"
                + "y 100 monedas de oro por cada castillo.",50*1+100*1,TipoSorpresa.PORCASAHOTEL));
        mazo.add(new Sorpresa("Reunes a los Señores de la grandes casas para tratar de "
                + "disminuir los saqueos en tus tierras, todos los Señores te dan "
                + "250 monedas de oro en compensación",250*1,TipoSorpresa.PORJUGADOR));
        mazo.add(new Sorpresa("La guerra con los demas Señores por tu intento de seperar "
                + "tu territorio de los Siete Reinos termina contigo derrotado por ello "
                + "tienes que pagar un tributo por a verla provocado, tienes que pagar "
                + "250 monedas de oro a cada jugador",-250*1,TipoSorpresa.PORJUGADOR));
    } 
    
    public Tablero getTablero(){
        return tablero;
    }
}
