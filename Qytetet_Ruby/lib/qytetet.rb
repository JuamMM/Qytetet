# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Qytetet
    attr_accessor:mazo
  def initialize
    @mazo = Array.new
  end
  
  def inicializar_cartas_sorpresa
    @mazo<<Sorpresa.new("La seguridad de la celda deja mucho que desear,
             simplemente andas hasta tu libertad",TipoSorpresa::SALIRCARCEL,0)
  end
  
  def consultor_mazo
    @mazo.to_s()
  end
end
