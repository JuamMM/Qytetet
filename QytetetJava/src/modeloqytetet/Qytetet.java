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
    
    static private Qytetet juego; 
    
    
    int MAX_JUGADORES=4;
    int NUM_SORPRESAS=10;
    public int NUM_CASILLAS=20;
    int PRECIO_LIBERTAD=200;
    int SALDO_SALIDA=1000;
    
    private ArrayList<Sorpresa> mazo = new ArrayList<> ();
    private Tablero tablero;
    private Dado dado;
    private Jugador jugadorActual;  // por inicializar
    private ArrayList<Jugador> jugadores; // por inicializar
    private Sorpresa cartaActual;
    
    
    
    public Qytetet(){
        inicializarTablero();
        jugadores= new ArrayList<> ();
        dado = Dado.getInstance();

    }
    
    public static Qytetet getInstance(){
        if(juego == null){
            juego = new Qytetet();
        }
    return juego;
    }
    
    @Override
    public String toString() {
        return "Qytetet{" + "dado=" + dado + ", tablero=" + tablero + ", jugadorActual=" 
                + jugadorActual + ", jugadores=" + jugadores + ", mazo=" + mazo + ", cartaActual=" 
                + cartaActual + '}';
    }
    
    public Tablero getTablero(){
        return tablero;
    }
    
    //void actuarSiEnCasillaEdificable(){}
    
    //void actuarSiEnCasillaNoEdificable(){}
    
    //public void aplicarSorpresa(){}
    
    //public Boolean cancelarHipoteca(int numeroCasilla){}
    
    //public Boolean edificarCasa(int numeroCasilla){}
    
    //public Boolean edificarHotel(int numeroCasilla){}
    
    //private void encarcelarJugador(){}
    
    Sorpresa getCartaAltual(){
        return this.cartaActual;
    }
    
    Dado getDado(){
        return this.dado;
    }
    
    Jugador getJugadorActual(){
        return this.jugadorActual;
    }
    
    public ArrayList<Jugador>getJugadores(){
        return jugadores;
    }
    
    ArrayList getMazo(){
        return mazo;
    }
    
    //public int getValorDado(){}
    
    //public void hipotecarPropiedad(int numeroCasilla){}
    
    private void inicializarCartasSorpresa(){
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

    public void iniciarJuego(ArrayList<String> nombres){
        this.inicializarCartasSorpresa();
        this.inicializarTablero();
        this.inicializarJugadores(nombres);
        //this.salidaJugadores(); // Falta hacer metodo
    }
    
    private void inicializarJugadores(ArrayList<String> nombres){
        
        for(int i = 0; i < nombres.size(); i++){
            this.jugadores.add( new Jugador(nombres.get(i)) );
        }
}
 
    private void inicializarTablero(){
        tablero = new Tablero();
    }
    
    //private Boolean intentarSalircarcel(){}
    
    //private jugar(){}
    
    //void mover(int numCasillaDestino){}
    
    //public Casilla obtenerCasillaJugadorActual(){}
    
    //public int obtenerCasillasTablero(){}
    
    //public ArrayList<int> obtenerPropiedadesJugador(){}
    
    //public ArrayList<int> obtenerPropiedadesJugadorSegunEstadoHipoteca(Boolean estadoHipoteca)
    
    //public void obtenerRanking(){}
    
    //public int obtenerSaldoJugadorActual(){}
    
    private void salidaJugadores(){
        for(int i = 0; i < this.jugadores.size(); i++){
            // Establecemos a cada jugador en la casilla 0 -> Casilla de salida
            jugadores.get(i).setCasillaActual(tablero.obtenerCasillaNumero(0));
            
            // Establecemos a cada jugador el saldo a 7500
            jugadores.get(i).setSaldo(7500);            

}
    
    private void setCartaActual(Sorpresa cartaActual){}
    
    //public void siguienteJugado(){}
    
    //int tirarDado(){}
    
    //public Boolean venderPropiedad(int numeroCasilla){}
    
    
}
