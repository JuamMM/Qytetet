# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding: utf-8

class Qytetet
    
    require "singleton"
    include Singleton
  
    attr_accessor:mazo
    attr_reader:max_jugadores
    attr_reader:num_sorpresas
    attr_accessor:num_jugadores
    attr_accessor:num_casillas
    attr_reader:precio_libertad
    attr_reader:saldo_salida
    attr_accessor:tablero
    attr_accessor:carta_actual
    attr_accessor:jugador_actual
    attr_accessor:dado
    attr_accessor:jugadores
    attr_accessor:indice_jugador_actual
    attr_accessor:contador
    attr_accessor:precio_liber
    
  def initialize
    @mazo = Array.new
    @max_jugadores=4
    @num_sorpresas=10
    @num_casillas=20
    @precio_libertad=200
    @saldo_salida=1000
    @jugadores=Array.new
    @dado=Dado.instance
    @precio_liber=750
    
  end
  
  def actuar_si_en_casilla_edificable
    
  end
  
  def actuar_si_en_casilla_no_edificable
  
  end
  
  #def aplicar_sorpresa
    
  #end
  
  def cancelar_hipoteca(numero_casilla)
    @jugador_actual.cancelar_hipoteca(@tablero.obtener_casilla_numero(numero_casilla).get_titulo_propiedad)
  end
  
  def comprar_titulo_propiedad
    @jugadores[@contador].comprar_titulo_propiedad
  end
  
  def edificar_casa(numero_casilla)
    edifica=@tablero.obtener_casilla_numero(numero_casilla).get_titulo_propiedad
    @jugadores[@contador].edificar_casa(edifica)
  end
  
  def edificar_hotel(numero_casilla)
   @jugadores[@contador].edificar_hotel(@tablero.obtener_casilla_numero(numero_casilla).get_titulo_propiedad)
  end
  
  def encarcelar_jugador
    if @jugador_actual.tengo_carta_libertad
      @jugador_actual.devolver_carta_libertad
    else
    @jugador_actual.ir_a_carcel(@tablero.get_carcel)
    @estado=EstadoJuego::JA_ENCARCELADO
    end
  end
  
  def get_carta_actual
    return @carta_actual
  end
  
  def get_dado
    @dado = Dado.new
    return @dado.get_valor
  end
  
  def get_jugador_actual
    return @jugador_actual
  end
  
  def get_jugadores
    return @jugadores
  end
  
  def get_mazo
    return @mazo
  end
  
  def get_valor_dado
    return @dado.get_valor
  end
  
  def hipotecar_propiedad
    @jugador_actual.hipotecar_propiedad(@jugador_actual.get_casilla_actual.get_titulo_propiedad)
  end
  
  
  def inicializar_juego(nombres)
    inicializar_jugadores(nombres)
    inicializar_tablero
    inicializar_cartas_sorpresa
    salida_jugadores
  end
  
  private
  
  def inicializar_jugadores(nombres)
    @num_jugadores=nombres.size
    for i in 0..nombres.size()-1
      @jugadores<<Jugador.new(nombres[i])
    end
  end
  
  def inicializar_tablero
    @tablero=Tablero.new
  end
  
  public
  
  def intentar_salir_carcel(metodo_salir_carcel)
    if metodo_salir_carcel==MetodoSalirCarcel::TIRANDODADO
      resultado = tirar_dado()
      if resultado>5
        @estado_juego=EstadoJuego::JA_PREPARADO
        @jugador_actual.set_encarcelado(false)
      end
    end
    if metodo_salir_carcel==MetodoSalirCarcel::PAGANDOLIBERTAD
      @jugador_actual.pagar_libertad(@precio_liber)
      @estado_juego=EstadoJuego::JA_PREPARADO
    end
  end
  
  def jugar
    casilla_final=@tablero.obtener_casilla_final(@jugador_actual.get_casilla_actual,@dado.tirar)
    mover(casilla_final.get_numero_casilla)
  end
  
  def mover(num_casilla_destino)
    @jugadores[@contador].set_casilla_actual(@tablero.obtener_casilla_numero(num_casilla_destino))
  end
  
  def obtener_casilla_jugador_actual
    return @jugador_actual.get_casilla_actual
  end
  
  def obtener_casillas_tablero
    return @tablero.get_casillas
  end
  
  def obtener_propiedades_jugador
    devolver=Array.new
    recorrer=@jugador_actual.get_propiedades
    for i in 0..recorrer.size()-1
      for a in 0..19
        if recorrer[i]==@tablero.obtener_casilla_numero(a).get_titulo_propiedad
          devolver<<@tablero.obtener_casilla_numero(a).get_numero_casilla
        end
      end
    end
    return devolver
  end
  
  def obtener_propiedades_jugador_segun_estado_hipoteca(estado_hipoteca)
    devolver = Array.new
    recorrer = Array.new
    recorrer=@jugador_actual.obtener_propiedades(estado_hipoteca)
    for i in 0..recorrer.size()-1
      for a in 0..19
        if recorrer[i]==@tablero.obtenerobtener_casilla_numero(a).get_titulo_propiedad
          devolver<<@tablero.obtener_casilla_numero(a).get_numero_casilla
        end
      end
    end
    return devolver
  end
  
  def obtener_ranking
    @jugadores=@jugadores.sort
  end
  
  def obtener_saldo_jugador_actual
    @jugador_actual.get_saldo
  end
  
  def saldo_jugadores
    devolver = Array.new
    for i in 0..@jugadores.size()-1
      devolver<<@jugadores[i].get_saldo
    end
    return devolver
  end
  
  def salida_jugadores
    for i in 0..@num_jugadores-1
      @jugadores[i].set_casilla_actual(@tablero.obtener_casilla_numero(0))
    end
    @contador=rand(3)
    @jugador_actual=@jugadores[@contador]
    @estado_juego=EstadoJuego::JA_PREPARADO
  end
  
  def set_carta_actual(carta)
    @carta_actual=carta
  end
  
  def siguiente_jugador
    if(@contador==3)
      @contador=0
    else
      @contador += 1
    end
    
    @jugador_actual = @jugadores[@contador]
    
    if(@jugador_actual.get_encarcelado)
      @estado_juego=EstadoJuego::JA_ENCARCELADOCONOPCIONDELIBERTAD
    else
      @estado_juego=EstadoJuego::JA_PREPARADO
    end
  end
  
  def tirar_dado
    return @dado.tirar
  end
  
  def vender_propiedad(numero_casilla)
    @jugador_actual.vender_propiedad(@tablero.obtener_casilla_numero(numero_casilla))
  end
  
  private
  
  def inicializar_cartas_sorpresa
        @mazo<<Sorpresa.new("La seguridad de la celda deja mucho que desear,
             simplemente andas hasta tu libertad",TipoSorpresa::SALIRCARCEL,0)
    
        @mazo<<Sorpresa.new("Te han pillado robando comida en el Lecho de "\
              "Pulgas ,debes ir a las mazmorras de Desembarco del Rey.", TipoSorpresa::IRACASILLA,@tablero.get_carcel)
          
        @mazo<<Sorpresa.new("Viajas al Muro porque quieres mear desde lo alto.",
                TipoSorpresa::IRACASILLA,9)
              
        @mazo<<Sorpresa.new("Viajas a Desembarco del rey, para reunirte con La Mano",TipoSorpresa::IRACASILLA,19)
        
        @mazo<<Sorpresa.new("Los guardias de las mazmorras se han quedado"\
              " dormidos y consigues escapar,quedas libre de las mazmorras.",TipoSorpresa::SALIRCARCEL,0)
          
        @mazo<<Sorpresa.new("Caminas por el bosque y te encuentras a unos bandidos" \
                "y te amenazan con matarte, pierdes 500 monedas de oro.",
                TipoSorpresa::PAGARCOBRAR,-500)
              
        @mazo<<Sorpresa.new("Te encuentras una bolsa con oro, recibes 500",TipoSorpresa::PAGARCOBRAR,500)
        
        @mazo<<Sorpresa.new("Los saqueos han comenzado en las ciudades por escasez de" \
                 "alimentos y los mas pobres asaltan posadas y castillos. Tienes que" \
                 "repararlos, pagas 50 monedas de oro por posada y 100 monedas de oro" \
                 "por castillo.",TipoSorpresa::PORCASAHOTEL,-100)
             
        @mazo<<Sorpresa.new("La gran gestion de La Mano(Tyrion Lannister) hace " \
                 "que las posadas de todo el reino se llenen y los castillos vuelvan a " \
                 "recuperar el honor de otras epocas, recibes 50 monedas de oro por posada" \
                 "y 100 monedas de oro por cada castillo.",TipoSorpresa::PORCASAHOTEL,100)
             
        @mazo<<Sorpresa.new("Reunes a los jugadores de la grandes casas para tratar de " \
                 "disminuir los saqueos en tus tierras, todos los jugadores te dan " \
                "250 monedas de oro en compensacion",TipoSorpresa::PORJUGADOR,250*@num_jugadores)
            
        @mazo<<Sorpresa.new("La guerra con los demas jugadores por tu intento de separar " \
                "tu territorio de los Siete Reinos termina contigo derrotado por ello " \
                "tienes que pagar un tributo por a verla provocado, tienes que pagar " \
                "250 monedas de oro a cada jugadores",TipoSorpresa::PORJUGADOR,-250*@num_jugadores)
  end
  
  public
  
  def consultor_mazo
    for i in 0..@mazo.size()-1
      puts @mazo[i].to_s()
    end
  end
  
  def get_jugador_actual
    return @jugador_actual
  end
  
  def set_estado_juego(estado)
    @estado_juego=estado
  end
  
end
