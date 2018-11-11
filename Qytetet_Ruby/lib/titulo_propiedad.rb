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
    return @numcasas
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
  
  def get_factor_revalorizacion
    return @factor_revalorizacion
  end
  
  def calcular_coste_cancelar
    return @hipoteca_base + @numcasas *0.5 * @hipoteca_base + @numhoteles * @hipoteca_base
  end
  
  def calcular_coste_hipotecar
    return @hipoteca_base + (@factor_revalorizacion * @numcasas) + (@factor_revalorizacion * @numhoteles)
  end
  
  def calcular_importe_alquiler
    return @alquiler_base + (@factor_revalorizacion * @numcasas) + (@factor_revalorizacion * @numhoteles)
  end
  
  def calcular_precio_venta
    return @precio_compra + (@numhoteles + @numcasas) *@precio_edificar * @factor_revalorizacion
  end
  
  def cancelar_hipoteca
    @hipotecada=false
  end
  
  def cobrar_alquiler(coste)
    @propietario.modificar_saldo(-1*coste)
  end
  
  def edificar_casa
    if (@propietario.tengo_saldo(@precio_edificar)) && @numcasas<4
      @propietario.modificar_saldo(-1*@precio_edificar)
      @numcasas=@numcasas +1
    end
  end
  
  def edificar_hotel
    if (@propietario.tengo_saldo(@precio_edificar)) && @numcasas==4
      @propietario.modificar_saldo(-1*@precio_edificar)
      @numcasas=0
      @numhoteles=@numhoteles +1
    end
  end
  
  def hipotecar
    @hipotecada=true
  end
  
  def get_propietario
    return @propietario
  end
  
  def pagar_alquiler
    devolver=calcular_importe_alquiler
    @propietario.modificar_saldo(devolver)
    return devolver
  end
  
  def propietario_encarcelado
  devolver=false
    if @propietario.get_encarcelado
      devolver=true
    end
   return devolver
  end
  
  def set_hipotecada(hipotecada)
    @hipotecada=hipotecada
  end
  
  def set_propietario(unPropietario)
    @propietario=unPropietario
  end
  
  def tengo_propietario
    devolver=true
    if @propietario==nil
      devolver=false
    end
    return devolver
  end
  
  @Overrride
  def to_s()
    return "#{@nombre}(#{@hipotecada},#{@precio_compra},#{@alquiler_base},#{@factor_revalorizacion},#{@hipoteca_base},#{@precio_edificar},#{@numcasas},#{@numhoteles})\n"\
  end
  
end
