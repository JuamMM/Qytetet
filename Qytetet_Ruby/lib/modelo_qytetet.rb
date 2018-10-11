# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class PruebaQytetet
require_relative "qytetet"
require_relative "sorpresa"
require_relative "tipo_sorpresa"
require_relative "tipo_casilla"
  attr_accessor:objetoQytetet
  def initialize
    @objetoQytetet = Qytetet.new
  end
  
  def main
    @objetoQytetet.inicializar_cartas_sorpresa
    puts @objetoQytetet.mazo.inspect
  end
 
end

juego = PruebaQytetet.new

juego.main
  
end