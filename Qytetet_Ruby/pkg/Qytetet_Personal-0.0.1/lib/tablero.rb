# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Tablero
  attr_accessor :Casilla
  attr_accessor :Carcel
  attr_accessor :num_casillas
  
  public
  def initialize    
      @Casilla = Array.new
      @num_casillas=20
      incializar_tablero()

  end
  
  def incializar_tablero()
    
    @Casilla<<Casilla.const2(0, TipoCasilla::SALIDA)
    @Casilla<<(Casilla.const1(1, TipoCasilla::CALLE, Titulo_propiedad.new("Lecho de Pulgas", false, 50, 10, 1.10, 25, 30)))
    @Casilla<<(Casilla.const1(2, TipoCasilla::CALLE, Titulo_propiedad.new("Llanuras Dothraki", false, 100, 25, 1.10, 50, 30)))
    @Casilla<<(Casilla.const2(3, TipoCasilla::IMPUESTO))
    @Casilla<<(Casilla.const1(4, TipoCasilla::CALLE, Titulo_propiedad.new("Mas Alla del Muro",false,150,40,1.10,75,30)))
    @Casilla<<(Casilla.const2(5, TipoCasilla::CARCEL))
    @Casilla<<(Casilla.const1(6, TipoCasilla::CALLE, Titulo_propiedad.new("Nido del Aguila",false,200,55,1.25,100,60)))
    @Casilla<<(Casilla.const2(7, TipoCasilla::SORPRESA))
    @Casilla<<(Casilla.const1(8, TipoCasilla::CALLE, Titulo_propiedad.new("Bahia de Esclavos", false, 250, 70, 1.25, 125, 60)))
    @Casilla<<(Casilla.const1(9, TipoCasilla::CALLE, Titulo_propiedad.new("EL Muro", false, 300, 95, 1.25, 150, 60)))
    @Casilla<<(Casilla.const2(10, TipoCasilla::PARKING))
    @Casilla<<(Casilla.const1(11, TipoCasilla::CALLE, Titulo_propiedad.new("Antigua", false, 350, 110, 1.25, 175, 90)))
    @Casilla<<(Casilla.const1(12, TipoCasilla::CALLE, Titulo_propiedad.new("Dorne", false, 400, 125, 1.25, 200, 90)))
    @Casilla<<(Casilla.const2(13, TipoCasilla::SORPRESA))
    @Casilla<<(Casilla.const1(14, TipoCasilla::CALLE, Titulo_propiedad.new("Invernalia", false, 450, 140, 1.35, 225, 90)))
    @Casilla<<(Casilla.const2(15, TipoCasilla::JUEZ))
    @Casilla<<(Casilla.const1(16, TipoCasilla::CALLE, Titulo_propiedad.new("Rocadragon",false,500,165,1.35,250,120)))
    @Casilla<<(Casilla.const2(17, TipoCasilla::SORPRESA))
    @Casilla<<(Casilla.const1(18, TipoCasilla::CALLE, Titulo_propiedad.new("Bravos",false,550,170,1.35,275,120)))
    @Casilla<<(Casilla.const1(19, TipoCasilla::CALLE, Titulo_propiedad.new("Desembarco del rey",false,600,200,1.50,300,180)))
    @Casilla<<(Casilla.const2(15, TipoCasilla::JUEZ))
    @Casilla<<(Casilla.const1(16, TipoCasilla::CALLE, Titulo_propiedad.new("Rocadragon",false,500,165,1.35,250,120)))
    @Casilla<<(Casilla.const2(17, TipoCasilla::SORPRESA))
    @Casilla<<(Casilla.const1(18, TipoCasilla::CALLE, Titulo_propiedad.new("Bravos",false,550,170,1.35,275,120)))
    @Casilla<<(Casilla.const1(19, TipoCasilla::CALLE, Titulo_propiedad.new("Desembarco del rey",false,600,200,1.50,300,180)))
    @Casilla<<(Casilla.const2(15, TipoCasilla::JUEZ))
    @Casilla<<(Casilla.const1(16, TipoCasilla::CALLE, Titulo_propiedad.new("Rocadragon",false,500,165,1.35,250,120)))
    @Casilla<<(Casilla.const2(17, TipoCasilla::SORPRESA))
    @Casilla<<(Casilla.const1(18, TipoCasilla::CALLE, Titulo_propiedad.new("Bravos",false,550,170,1.35,275,120)))
    @Casilla<<(Casilla.const1(19, TipoCasilla::CALLE, Titulo_propiedad.new("Desembarco del rey",false,600,200,1.50,300,180)))
    
    @Carcel=@Casilla[5]  
  end
  
  

  
  public
  
  def es_casilla_carcel(numeroCasilla)
    devolver = false
    if(numeroCasilla==@Carcel.get_numero_casilla())
      devolver=true
    end   
    return devolver
  end
  
  def obtener_casilla_numero(numeroCasilla)
    devolver = @Casilla[numeroCasilla]
    return devolver
  end
  
  def obtener_casilla_final(casilla,desplazamiento)
    suma = 0
    suma = casilla.get_numero_casilla() + desplazamiento
    if(suma>@num_casillas-1)
      suma = suma - @num_casillas
    end
    return @Casilla[suma]
  end
  
  def get_casillas
    return @Casilla
  end
  
  def get_carcel
    return @Carcel
  end
  
  @Overrride
  def to_s()
    for i in 0..19
      puts @Casilla[i].to_s()
    end
  end
end
