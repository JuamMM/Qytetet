# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Titulo_propiedad
  private
  attr_accessor :nombre
  attr_accessor :hipotecada
  attr_accessor :precio_compra
  attr_accessor :alquiler_base
  attr_accessor :factor_revalorizacion
  attr_accessor :hipoteca_base
  attr_accessor :precio_edificar
  attr_accessor :num_casas
  attr_accessor :num_hoteles
  attr_accessor :propietario
  
  def initialize (unNombre,unHipotecada,unPrecio,unAlquiler,unFactor,unaHipoteca,unEdificar)
    @nombre=unNombre
    @hipotecada=unHipotecada
    @precio_compra=unPrecio
    @alquiler_base=unAlquiler
    @factor_revalorizacion=unFactor
    @hipoteca_base=unaHipoteca
    @precio_edificar=unEdificar
    @numcasas=0
    @numhoteles=0
  end
  
  public
  
  def get_nombre
    return @nombre
  end
  
  def get_hipotecada
    return @hipotecada
  end
  
  def get_precio_compra
    return @precio_compra
  end
  
  def get_alquiler_base
    return @alquiler_base
  end
  
  def get_numcasas
    return @numcasa
  end
  
  def get_numhoteles
    return @numhoteles
  end
  
  def get_precio_edificar
    return @precio_edificar
  end
  
  def get_hipoteca_base
    return @hipoteca_base
  end
  
  def get_factor_revalorzacion
    return @factor_revalorizacion
  end
  
  #def calcular_coste_cancelar
  
  #end
  
  #def calcular_coste_hipotecar
  
  #end
  
  #def calcular_importe_alquiler
  
  #end
  
  #def calcular_precio_venta
  
  #end
  
  #def cancelar_hipoteca
  
  #end
  
  #def cobrar_alquiler(coste)
  
  #end
  
  #def edificar_casa
  
  #end
  
  #def edificar_hotel
  
  #end
  
  #def hipotecar
  
  #end
  
  def get_propietario
    return @propietario
  end
  
  #def pagar_alquiler
  
  #end
  
  #def propietario_encarcelado
  
  #end
  
  #def set_hipotecada(hipotecada)
  
  #end
  
  def set_propietario(unPropietario)
    @propietario=unPropietario
  end
  
  #def tengo_propietario
  
  #end
  
  @Overrride
  def to_s()
    return "Nombre: #{@nombre}\n"\
           "Hipotecada: #{@hipotecada}\n"\
           "Precio de compra: #{@precio_compra}\n"\
           "Alquiler: #{@alquiler_base}\n"\
           "Factor revalorizacion: #{@factor_revalorizacion}\n"\
           "Hipoteca base:: #{@hipoteca_base}\n"\
           "Precio edificar: #{@precio_edificar}\n"\
           "Numero de casas: #{@numcasas}\n"\
           "Numero de hoteles: #{@numhoteles}\n"\
  end
  
end
