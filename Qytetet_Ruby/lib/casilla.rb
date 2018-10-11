# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Casilla
    attr_accessor :numero_casilla
    attr_accessor :coste
    attr_accessor :tipo_casilla
    attr_accessor :titulo_propiedad
    
  public
  
  def const1(unNumero,unPrecio,unTipoCasilla,unTituloPropiedad)
    @numero_casilla=unNumero
    @coste=unPrecio
    @tipo_casilla=unTipoCasilla
    @titulo_propiedad=unTituloPropiedad
  end
  
  def const2(unNumero,unTipoCasilla)
    @numero=unNumero
    @tipo_casilla=unTipoCasilla
  end
  private
  def initialize
    
  end
end
