# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#encoding: utf-8

module ModeloQytetet
  class PruebaQytetet
require_relative "qytetet"
require_relative "sorpresa"
require_relative "tipo_sorpresa"
require_relative "titulo_propiedad"
require_relative "tipo_casilla"
require_relative "casilla"
require_relative "tablero"
require_relative "jugador"
require_relative "dado"

  attr_accessor:objetoQytetet
  attr_accessor:nombres
  attr_accessor:prueba
  
    
  def initialize
    @prueba=Titulo_propiedad.new("Invernalia", false, 450, 140, 1.35, 225, 90)
    @nombres=Array.new
  
    @nombres<<"Primero"
    @nombres<<"Segundo"
    @nombres<<"Tercero"
    @nombres<<"Cuarto"
    
    @objetoQytetet = Qytetet.new
  end
    
  def main
    @objetoQytetet.inicializar_juego(@nombres)
    puts @objetoQytetet.get_jugador_actual.to_s
  end
 
end

juego = PruebaQytetet.new

juego.main
  
end