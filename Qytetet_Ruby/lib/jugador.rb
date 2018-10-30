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
    @saldo=7.500
  end
  
  #def cancelar_hipoteca
  
  #end
  
  #def comprar_titulo_propiedad
  
  #end
  
  #def cuantas_casas_hoteles_tengo
  
  #end
  
  #def debo_pagar_alquiler
  
  #end
  
  #def devolver_carta_libertad
  
  #end
  
  #def edificar_casa(unTituloPropiedad)
  
  #end
  
  #def edificar_hotel(unTituloPropiedad)
  
  #end
  
  #def eliminar_de_mis_propiedades(unTituloPropiedad)
  
  #end
  
  #def es_de_mi_propiedad(unTituloPropiedad)
  
  #end
  
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
  
  #def modificar_saldo(cantidad)
  
  #end
  
  #def obtener_capital
  
  #end
  
  #def obtener_propiedades(hipotecada)
  
  #end
  
  #def pagar_alquiler
  
  #end
  
  #def pagar_impuesto
  
  #end
  
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
  
  #def tengo_carta_libertad
    
  #end
  
  #def tengo_saldo(cantidad)
  
  #end
  
  #def vender_propiedad(casilla)
  
  #end
  
end
