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
    set_titulo(unTituloPropiedad)
  end
  
  def const2(unNumero,unTipoCasilla)
    @numero_casilla=unNumero
    @tipo_casilla=unTipoCasilla
    @coste=0
  end
  
  def initialize ()
    @numero=-1
    @coste=-1
  end
  
  def get_numero_casilla
    return @numero_casilla
  end
  
  def get_coste
    return @coste
  end
  
  def get_tipo_casilla
    return @tipo_casilla
  end
  
  def get_titulo_propiedad
    return @titulo_propiedad
  end
  
  @Overrride
  def to_s()
    if @coste==0 then
      return "Casilla: #{@numero_casilla} \n Tipo de Casilla: #{@tipo_casilla}" 
    else
      return "Casilla: #{@numero_casilla} \n Tipo de Casilla: #{@tipo_casilla} 
                \n Coste: #{@coste} \n Titulo Porpiedad: #{@titulo_propiedad}"
    end
 end
  
  private 
  def set_titulo(unTituloPropiedad)
    @titulo_propiedad=unTituloPropiedad
  end
  

end
