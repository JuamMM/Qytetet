# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Jugador
  attr_accessor:encarcelado
  attr_accessor:nombre
  attr_accessor:saldo
  attr_accessor:carta_libertad
  attr_accessor:propiedades
  attr_accessor:casilla_actual
  
  def initialize(unNombre)
    @encarcelado=false
    @nombre=unNombre
    @saldo=7500
    @propiedades = Array.new
  end
  
  #def cancelar_hipoteca
  
  #end
  
  #def comprar_titulo_propiedad
  
  #end
  
  def cuantas_casas_hoteles_tengo
    devolver = 0
    for i in 0..@propiedades.size()
      devolver += @propiedades[i].get_numcasas()
      devolver += @propiedades[i].get_numhoteles()
    end
    return devolver
  end
  
  #def debo_pagar_alquiler
  
  #end
  
  def devolver_carta_libertad
    devolver = Sorpresa.new(@carta_libertad.get_texto,@carta_libertad.get_tipo,@carta_libertad.get_valor)
    @carta_libertad=null
    return devolver
  end
  
  #def edificar_casa(unTituloPropiedad)
  
  #end
  
  #def edificar_hotel(unTituloPropiedad)
  
  #end
  
  #def eliminar_de_mis_propiedades(unTituloPropiedad)
  
  #end
  
  def es_de_mi_propiedad(unTituloPropiedad)
    devolver = false
    for i in 0..@propiedades.size
      if(@propiedades[i].get_nombre()==unTituloPropiedad.get_nombre())
        devolver = true
      end
    end
    return devolver
  end
  
  #def estoy_en_calle_libre
  
  #end
  
  def get_carta_libertad
   return @carta_libertad
  end
  
  def get_casilla_actual
    return @casilla_actual
  end
  
  def get_encarcelado
    return @encarcelado
  end
  
  def get_nombre
    return @nombre
  end
  
  def get_propiedades
    return @propiedades
  end
  
  def get_saldo
    return @saldo
  end
  
  #def hipotecar_propiedad(unTituloPropiedad)
  
  #end
  
  #def ir_a_carcel(Casilla)
  
  #end
  
  def modificar_saldo(cantidad)
    @saldo += cantidad
    return @saldo
  end
  
  def obtener_capital
    devolver = @saldo
    for i in 0..@propiedades.size()
      if(@propiedades[i].get_hipotecada)
        devolver -= @propiedades[i].get_hipoteca_base
      else
        devolver += @propiedades[i].get_precio_compra()
        devolver += @propiedades[i].get_numcasas() * @getpropiedades[i].get_factor_revalorizacion()
      end
    end
    return devolver
  end
  
  def obtener_propiedades(hipotecada)
    devolver = Array.new
    for i in 0..@propieades.size()
      if(@propieades[i].get_hipotecada==hipotecada)
        devolver<<@propiedades[i]
      end
    end
    return devolver
  end
  
  #def pagar_alquiler
  
  #end
  
  def pagar_impuesto
    @saldo -= @casilla_actual.get_coste
  end
  
  #def pagar_libertad(cantidad)
  
  #end
  
  def set_carta_libertad(carta)
    @carta_libertad=Sorpresa.new("Los guardias de las mazmorras se han quedado"\
              " dormidos y consigues escapar,quedas libre de las mazmorras.",TipoSorpresa::SALIRCARCEL,0)
  end
  
  def set_casilla_actual(casilla)
    @casilla_actual=casilla
  end
  
  def set_encarcelado(encarcelado=false)
    @encarcelado=encarcelado
  end
  
  def tengo_carta_libertad
    devolver = false
    if(@carta_libertad!=null)
      devolver = true
    end
    return devolver
  end
  
  def tengo_saldo(cantidad)
    devolver = false
    if(@saldo>=cantidad)
      devolver = true
    end
    return devolver
  end
  
  #def vender_propiedad(casilla)
  
  #end
  
  @Overrride
  def to_s()
    if(@propiedades.size==0)
      return "Nombre: #{@nombre}\n"\
              "Saldo: #{@saldo}\n"\
              "Encarcelado: #{@encarcelado}\n"\
              "Casilla actual: #{@casilla_actual}\n"\
              "Tiene carta libertad: #{@carta_libertad}\n"\
    else
      return "Nombre: #{@nombre}\n"\
           "Saldo: #{@saldo}\n"\
           "Capital: #{obtener_capital}\n"\
           "Encarcelado: #{@encarcelado}\n"\
           "Casilla actual: #{@casilla_actual}\n"\
           "Tiene carta libertad: #{@carta_libertad}\n"\
           "Propiedades: #{
              for i in 0.. @propiedades.size 
                @propiedades.to_s()
              end
          }\n"\
     end
  end
  
end
