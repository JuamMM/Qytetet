/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloqytetet;

import java.util.ArrayList;
import java.util.Collections;
/**
 *
 * @author joseng2709
 */
public class Qytetet {
    
    static private Qytetet juego; 
    
    
    static int MAX_JUGADORES=4;
    static int NUM_SORPRESAS=10;
    public static int NUM_CASILLAS=20;
    static int PRECIO_LIBERTAD=200;
    static int SALDO_SALIDA=1000;
    
    private ArrayList<Sorpresa> mazo = new ArrayList<> ();
    private Tablero tablero;
    private Dado dado;
    private Jugador jugadorActual;  // por inicializar
    private ArrayList<Jugador> jugadores; // por inicializar
    private Sorpresa cartaActual;
    private int indiceJugadorActual;
    private EstadoJuego estadoJuego;
    
    
    
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
    
    void actuarSiEnCasillaEdificable(){}
    
    //void actuarSiEnCasillaNoEdificable(){}
    
    /*public void aplicarSorpresa(){
     boolean tienePropietario = false;
        if(this.cartaActual.getTipoSorpresa() == TipoSorpresa.PAGARCOBRAR){
            this.jugadorActual.modificarSaldo(this.cartaActual.getValor());
        }else if(this.cartaActual.getTipoSorpresa() == TipoSorpresa.IRACASILLA){
            boolean esCarcel = this.tablero.esCasillaCarcel(this.cartaActual.getValor());
            if(esCarcel){
                this.encarcelarJugador();
            }else{
                Casilla nuevaCasilla = this.tablero.obtenerCasillaNumero(this.cartaActual.getValor());
            }
        }else if(this.cartaActual.getTipoSorpresa() == TipoSorpresa.PORCASAHOTEL){
            this.jugadorActual.pagarCobrarPorCasaYHotel(this.cartaActual.getValor());
        }else if(this.cartaActual.getTipoSorpresa() == TipoSorpresa.PORJUGADOR){
            for(int i = 0; i < this.jugadores.size(); i++){
                Jugador jugador = this.jugadores.get(i);
                if(jugador != this.jugadorActual){
                    jugador.modificarSaldo(this.cartaActual.getValor());
                    this.jugadorActual.modificarSaldo(-this.cartaActual.getValor());
                }
            }
        }
        
        if(this.cartaActual.getTipoSorpresa() == TipoSorpresa.SALIRCARCEL){
            this.jugadorActual.setCartaLibertad(cartaActual);
        }else{
            Sorpresa actual = this.cartaActual;
            this.mazo.remove(this.cartaActual);
            this.mazo.add(actual);            
        }
        
        
    return tienePropietario; 
    }*/
    
    //public Boolean cancelarHipoteca(int numeroCasilla){}
    
    public boolean edificarCasa(int numCasilla){
         return jugadorActual.edificarCasa(tablero.obtenerCasillaNumero(numCasilla).getTituloPropiedad());
    }
    
    public boolean edificarHotel(Casilla casilla){
        return jugadorActual.edificarHotel(casilla.getTituloPropiedad());
    }
    
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
    
    public int getValorDado(){
        return dado.getValor();
    }
    
    public void hipotecarPropiedad(int numeroCasilla){
        jugadorActual.hipotecarPropiedad(jugadorActual.getPropiedades().get(numeroCasilla));
    }
    
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
        this.salidaJugadores(); 
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
    
    private void jugar(){
        int resultado=tirarDado();
        Casilla casillaDestino=tablero.obtenerCasillaFinal(jugadorActual.getCasillaActual(), resultado);
        mover(casillaDestino.getNumeroCasilla());
    }
    
    void mover(int numCasillaDestino){
        jugadorActual.setCasillaActual(tablero.obtenerCasillaNumero(numCasillaDestino));
    }
    
    public Casilla obtenerCasillaJugadorActual(){
        return jugadorActual.getCasillaActual();
    }
    
    public ArrayList<Casilla> obtenerCasillasTablero(){
        return tablero.getPropiedades();
    }
    
    public ArrayList<Integer> obtenerPropiedadesJugador(){
        ArrayList<Integer> devolver;
        devolver=new ArrayList<> ();
        
        for(int i=0;i<(this.jugadorActual.getPropiedades().size()-1);i++){
            for(int j=0;j<19;j++){
                if(this.jugadorActual.getPropiedades().get(i)==tablero.obtenerCasillaNumero(j).getTituloPropiedad())
                    devolver.add(j);
            }
        }
        
        return devolver;
    }
    
    public ArrayList<Integer> obtenerPropiedadesJugadorSegunEstadoHipoteca(Boolean estadoHipoteca){
        ArrayList<Integer> devolver;
        devolver=new ArrayList<> ();
        
        for(int i=0;i<(this.jugadorActual.getPropiedades().size()-1);i++){
            for(int j=0;j<19;j++){
                if(this.jugadorActual.obtenerPropiedades(estadoHipoteca).get(i)==tablero.obtenerCasillaNumero(j).getTituloPropiedad())
                    devolver.add(j);

            }
        }
        return devolver;
    }
    
    public Boolean jugadorActualEnCalleLibre(){
        Boolean devolver;
        if(jugadorActual.estoyEnCalleLibre()==true)
            devolver=true;
        else
            devolver=false;
        
        return devolver;
    }
    
    public Boolean jugadorActualEncarcelado(){
        return jugadorActual.getEncarcelado();
    }
       
    public void obtenerRanking(){ 
        Collections.sort(this.jugadores);
    }
    
    public int obtenerSaldoJugadorActual(){
        return jugadorActual.getSaldo();
    }
    
    private void salidaJugadores(){
        for(int i = 0; i < this.jugadores.size(); i++){
            jugadores.get(i).setCasillaActual(tablero.obtenerCasillaNumero(0));
            jugadores.get(i).setSaldo(7500);            
        }
    }   
    
    private void setCartaActual(Sorpresa cartaActual){
        this.cartaActual=cartaActual;
    }
    
    public void setEstadoJuego(EstadoJuego estadoJuego){
        this.estadoJuego=estadoJuego;
    }
    
    public void siguienteJugador(){
        int posicion=0;
        Boolean encontrado=false;
        
        for(int i=0;i<this.jugadores.size() && !encontrado;i++){
            if(jugadorActual == jugadores.get(i)){
                posicion = i; 
                encontrado = true;
            }
        }
        if(posicion==this.jugadores.size())
            jugadorActual=this.jugadores.get(0);
        else
            jugadorActual=this.jugadores.get(posicion+1);
        
        if(jugadorActual.getEncarcelado()==true)
            setEstadoJuego(EstadoJuego.JA_ENCARCELADOCONOPCIONDELIBERTAD);
        else
            setEstadoJuego(EstadoJuego.JA_PREPARADO);
        
    }
    
    int tirarDado(){
       return dado.Tirar();
    }
    
    public Boolean venderPropiedad(int numeroCasilla){
        return jugadorActual.venderPropiedad(tablero.obtenerCasillaNumero(numeroCasilla));
    }
        
    
}
