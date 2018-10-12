# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Titulo_propiedad
  attr_accessor :nombre
  attr_accessor :hipotecada
  attr_accessor :precio_compra
  attr_accessor :alquiler_base
  attr_accessor :factor_revalorizacion
  attr_accessor :hipoteca_base
  attr_accessor :precio_edificar
  attr_accessor :num_casas
  attr_accessor :num_hoteles
  def initialize (unNombre,unHipotecada,unPrecio,unAlquiler,unFactor,unaHipoteca,unEdificar)
    @nombre=unNombre
    @hipotecada=unHipotecada
    @precio_compra=unPrecio
    @alquiler_base=unAlquiler
    @factor_revalorizacion=unFactor
    @hipoteca_base=unaHipoteca
    @precio_edificar=unEdificar
    @numcasas=0
    @numHoteles=0
  end
  
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
end
