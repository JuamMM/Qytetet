# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding: utf-8

class Qytetet
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
  def initialize
    @mazo = Array.new
    @max_jugadores=4
    @num_sorpresas=10
    @num_casillas=20
    @precio_libertad=200
    @saldo_salida=1000
    @jugadores=Array.new
    
  end
  
  #def actuar_si_en_casilla_edificable
    
  #end
  
  #def actuar_si_en_casilla_no_edificable
  
  #end
  
  #def aplicar_sorpresa
  
  #end
  
  #def cancelar_hipoteca(numero_casilla)
  
  #end
  
  #def comprar_titulo_propiedad
  
  #end
  
  #def edificar_casa(numero_casilla)
  
  #end
  
  #def edificar_hotel(numero_casilla)
  
  #end
  
  #def encarcelar_jugador
  
  #end
  
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
  
  #def get_mazo
  
  #end
  
  #def get_valor_dado
  
  #end
  
  #def hipotecar_propiedad
  
  #end
  
  #def inicializar_cartas_sorpresa
  
  #end
  
  def inicializar_juego(nombres)
    inicializar_jugadores(nombres)
    inicializar_tablero
    inicializar_cartas_sorpresa
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
  
  #def intentar_salir_carcel(metodo_salir_carcel)
  
  #end
  
  #def jugar
  
  #end
  
  #def mover(num_casilla_destino)
  
  #end
  
  #def obtener_casilla_jugador_actual
  
  #end
  
  def obtener_casillas_tablero
    return @tablero.get_casillas
  end
  
  #def obtener_propiedades_jugador
  
  #end
  
  #def obtener_propiedades_jugador_segun_estado_hipoteca(estado_hipoteca)
  
  #end
  
  #def obtener_ranking
  
  #end
  
  #def obtener_saldo_jugador_actual
  
  #end
  
  #def saldo_jugadores
  
  #end
  
  def set_carta_actual(carta)
    @carta_actual=carta
  end
  
  #def siguiente_jugador
  
  #end
  
  #def tirar_dado
  
  #end
  
  #def vender_propiedad(numero_casilla)
  
  #end
  
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
  
end
