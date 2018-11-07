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
    @carta_libertad=nil
  end
  
  def cancelar_hipoteca(unTituloPropiedad)
   if(unTituloPropiedad.calcular_coste_cancelar<=@saldo)
     @saldo -= unTituloPropiedad.calcular_coste_cancelar
     unTituloPropiedad.set_hipotecada(false)
   end
  end
  
  def comprar_titulo_propiedad
    if @casilla_actual.soy_edificable && @casilla_actual.tengo_propietario==false && @casilla_actual.get_coste<=@saldo
      @casilla_actual.asignar_propietario(self)
      @propiedades<<@casilla_actual.get_titulo_propiedad
      @saldo = @saldo - @casilla_actual.get_coste
    end
  end
  
  def cuantas_casas_hoteles_tengo
    devolver = 0
    for i in 0..@propiedades.size()
      devolver += @propiedades[i].get_numcasas()
      devolver += @propiedades[i].get_numhoteles()
    end
    return devolver
  end
  
  def debo_pagar_alquiler
    devolver=false
    if @casilla_actual.tengo_propietario && (es_de_mi_propiedad(@casilla_actual.get_titulo_propiedad)==false)
      devolver=true
    end
    return devolver
  end
  
  def devolver_carta_libertad
    devolver = Sorpresa.new(@carta_libertad.get_texto,@carta_libertad.get_tipo,@carta_libertad.get_valor)
    @carta_libertad=nil
    return devolver
  end
  
  def edificar_casa(unTituloPropiedad)
    unTituloPropiedad.edificar_casa
  end
  
  def edificar_hotel(unTituloPropiedad)
    unTituloPropiedad.edificar_hotel
  end
  
  def eliminar_de_mis_propiedades(unTituloPropiedad)
    nuevas = Array.new
    for i in 0..@propiedades.size()-1
      if @propiedades[i] != unTituloPropiedad
        nuevas<<@propiedades[i]
      end
    end
    @propiedades=nuevas
  end
  
  def es_de_mi_propiedad(unTituloPropiedad)
    devolver = false
    for i in 0..@propiedades.size()-1
      if(@propiedades[i].get_nombre==unTituloPropiedad.get_nombre)
        devolver = true
      end
    end
    return devolver
  end
  
  def estoy_en_calle_libre
    return @encarcelado
  end
  
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
  
  def hipotecar_propiedad(unTituloPropiedad)
    @saldo += unTituloPropiedad.calcular_coste_hipotecar
    unTituloPropiedad.hipotecar
  end
  
  def ir_a_carcel(casilla)
    @casilla_actual=casilla
    @encarcelado=true
  end
  
  def modificar_saldo(cantidad)
    @saldo += cantidad
    return @saldo
  end
  
  def obtener_capital
    devolver = @saldo
    for i in 0..@propiedades.size()-1
      if(@propiedades[i].get_hipotecada==true)
        devolver -= @propiedades[i].get_hipoteca_base
      else
        devolver += @propiedades[i].get_precio_compra()
        devolver += @propiedades[i].get_numcasas() * @propiedades[i].get_factor_revalorizacion()
      end
    end
    return devolver
  end
  
  def obtener_propiedades(hipotecada)
    devolver = Array.new
    for i in 0..@propieades.size()
      if(@propiedades[i].get_hipotecada==hipotecada)
        devolver<<@propiedades[i]
      end
    end
    return devolver
  end
  
  def pagar_alquiler
    pagar = @casilla_actual.get_titulo_propiedad.calcular_importe_alquiler
    modificar_saldo(-1*pagar)
  end
  
  
  def <=> (otroJugador)
    otro_capital = otroJugador.obtener_capital()
    mi_capital = obtener_capital
    if(otro_capital>mi_capital)
      return -1
    end
    if(otro_capital<mi_capital)
      return 1
    end
    return 0
  end
  
  def pagar_impuesto
     modificar_saldo(@casilla_actual.get_coste)
  end
  
  def pagar_libertad(cantidad)
    if(@saldo>=cantidad)
      @saldo -= cantidad
      set_encarcelado(false)
    end
  end
  
  def set_carta_libertad(carta)
    @carta_libertad=carta
  end
  
  def set_casilla_actual(casilla)
    @casilla_actual=casilla
  end
  
  def set_encarcelado(encarcelado=false)
    @encarcelado=encarcelado
  end
  
  def tengo_carta_libertad
    devolver = false
    if(@carta_libertad!=nil)
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
  
  def vender_propiedad(casilla)
    venta=casilla.get_titulo_propiedad.calcular_precio_venta
    modificar_saldo(venta)
    eliminar_de_mis_propiedades(casilla.get_titulo_propiedad)
  end
  
  @Overrride
  def to_s()
    texto = " "
    if(@propiedades.size==0)
      texto = "Nombre: #{@nombre}\n"\
              "Saldo: #{@saldo}\n"\
              "Capital: #{obtener_capital}\n"\
              "Encarcelado: #{@encarcelado}\n"\
              "Tiene carta libertad: #{@carta_libertad}\n"\
              "Casilla actual: #{@casilla_actual.get_numero_casilla}, #{@casilla_actual.get_tipo_casilla}\n"
            
            texto += "\n\n"
              
    else
      texto = "Nombre: #{@nombre}\n"\
           "Saldo: #{@saldo}\n"\
           "Capital: #{obtener_capital}\n"\
           "Encarcelado: #{@encarcelado}\n"\
           "Tiene carta libertad: #{tengo_carta_libertad}\n"\
           "Casilla actual: #{@casilla_actual.get_numero_casilla}, #{@casilla_actual.get_tipo_casilla}\n"\
           "Propiedades: Nombre(hipotecada, precio compra, alquiler, factor, hipoteca, prec. edificar, casas, hoteles\n"
           for i in 0..@propiedades.size()-1
             texto += @propiedades[i].to_s
           end
           texto += "\n\n"
      
     end
     return texto
  end
  
end
