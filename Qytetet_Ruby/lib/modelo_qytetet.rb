# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class PruebaQytetet
require_relative "qytetet"
require_relative "sorpresa"
require_relative "tipo_sorpresa"
require_relative "titulo_propiedad"
require_relative "tipo_casilla"
require_relative "casilla"
require_relative "tablero"
  attr_accessor:objetoQytetet
  attr_accessor:tablero
  
  def initialize
    @objetoQytetet = Qytetet.new
    @tablero = Tablero.new
  end
    
  def main
    @objetoQytetet.inicializar_cartas_sorpresa
    puts @tablero.to_s()
  end
 
end

juego = PruebaQytetet.new

juego.main
  
end