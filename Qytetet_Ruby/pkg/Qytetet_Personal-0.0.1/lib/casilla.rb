# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Casilla
    attr_accessor :numero_casilla
    attr_accessor :coste
    attr_accessor :tipo_casilla
    attr_accessor :titulo_propiedad
    
    
  public
  
  def initialize(unNumero,unTipoCasilla,unTituloPropiedad)
    @tipo_casilla=unTipoCasilla
    set_titulo(unTituloPropiedad)
    @numero_casilla=unNumero
    @coste=unTituloPropiedad.get_precio_compra
  end
  
  def self.const1(unNumero,unTipoCasilla,unTituloPropiedad)
     return new(unNumero,unTipoCasilla,unTituloPropiedad)
  end
  
  def self.const2(unNumero,unTipoCasilla)
    return new(unNumero,unTipoCasilla,Titulo_propiedad.new("", false, 0, 0, 0, 0, 0))
  end
  
  private_class_method :new
  
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
  
  def asignar_propietario(unJugador)
    @titulo_propiedad.set_propietario(unJugador)
  end
  
  def pagar_alquiler
    return @titulo_propiedad.pagar_alquiler
  end
  
  def propietario_encarcelado
    return @titulo_propiedad.propietario_encarcelado
  end
  
  def soy_edificable
    devolver = false
    if @tipo_casilla == TipoCasilla::CALLE
      devolver=true
    end
    return devolver
  end
  
  def tengo_propietario
    return @titulo_propiedad.tengo_propietario
  end
  
  @Overrride
  def to_s()
    if @coste==0 then
      return "Casilla: #{@numero_casilla} \nTipo de Casilla: #{@tipo_casilla} \n\n" 
    else
      return "Casilla: #{@numero_casilla} \nTipo de Casilla: #{@tipo_casilla} "\
                "\nCoste: #{@coste} \nTitulo Propiedad: #{@titulo_propiedad} \n"
    end
 end
  
  private 
  def set_titulo(unTituloPropiedad)
    @titulo_propiedad=unTituloPropiedad
  end
  

end
