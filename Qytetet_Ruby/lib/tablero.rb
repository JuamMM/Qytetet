# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Tablero
  attr_accessor :Casilla
  attr_accessor :Carcel
  
  public
  def initialize    
      @Casilla = Array.new(20)
      incializar_tablero()

  end
  
  def incializar_tablero()
    
    @Casilla.push(Casilla.new.const2(0, TipoCasilla::SALIDA))
    @Casilla.push(Casilla.new.const1(1, TipoCasilla::CALLE, Titulo_propiedad.new("Lecho de Pulgas", false, 50, 10, 1.10, 25, 30)))
    @Casilla.push(Casilla.new.const1(2, TipoCasilla::CALLE, Titulo_propiedad.new("Llanuras Dothraki", false, 100, 25, 1.10, 50, 30)))
    @Casilla.push(Casilla.new.const2(3, TipoCasilla::IMPUESTO))
    @Casilla.push(Casilla.new.const1(4, TipoCasilla::CALLE, Titulo_propiedad.new("Mas Alla del Muro",false,150,40,1.10,75,30)))
    @Casilla.push(Casilla.new.const2(5, TipoCasilla::CARCEL))
    @Casilla.push(Casilla.new.const1(6, TipoCasilla::CALLE, Titulo_propiedad.new("Nido del Aguila",false,200,55,1.25,100,60)))
    @Casilla.push(Casilla.new.const2(7, TipoCasilla::SORPRESA))
    @Casilla.push(Casilla.new.const1(8, TipoCasilla::CALLE, Titulo_propiedad.new("Bahia de Esclavos", false, 250, 70, 1.25, 125, 60)))
    @Casilla.push(Casilla.new.const1(9, TipoCasilla::CALLE, Titulo_propiedad.new("EL Muro", false, 300, 95, 1.25, 150, 60)))
    @Casilla.push(Casilla.new.const2(10, TipoCasilla::PARKING))
    @Casilla.push(Casilla.new.const1(11, TipoCasilla::CALLE, Titulo_propiedad.new("Antigua", false, 350, 110, 1.25, 175, 90)))
    @Casilla.push(Casilla.new.const1(12, TipoCasilla::CALLE, Titulo_propiedad.new("Dorne", false, 400, 125, 1.25, 200, 90)))
    @Casilla.push(Casilla.new.const2(13, TipoCasilla::SORPRESA))
    @Casilla.push(Casilla.new.const1(14, TipoCasilla::CALLE, Titulo_propiedad.new("Invernalia", false, 450, 140, 1.35, 225, 90)))
    @Casilla.push(Casilla.new.const2(15, TipoCasilla::JUEZ))
    @Casilla.push(Casilla.new.const1(16, TipoCasilla::CALLE, Titulo_propiedad.new("Rocadragon",false,500,165,1.35,250,120)))
    @Casilla.push(Casilla.new.const2(17, TipoCasilla::SORPRESA))
    @Casilla.push(Casilla.new.const1(18, TipoCasilla::CALLE, Titulo_propiedad.new("Bravos",false,550,170,1.35,275,120)))
    @Casilla.push(Casilla.new.const1(19, TipoCasilla::CALLE, Titulo_propiedad.new("Desembarco del rey",false,600,200,1.50,300,180)))
    @Casilla.push(Casilla.new.const2(15, TipoCasilla::JUEZ))
    @Casilla.push(Casilla.new.const1(16, TipoCasilla::CALLE, Titulo_propiedad.new("Rocadragon",false,500,165,1.35,250,120)))
    @Casilla.push(Casilla.new.const2(17, TipoCasilla::SORPRESA))
    @Casilla.push(Casilla.new.const1(18, TipoCasilla::CALLE, Titulo_propiedad.new("Bravos",false,550,170,1.35,275,120)))
    @Casilla.push(Casilla.new.const1(19, TipoCasilla::CALLE, Titulo_propiedad.new("Desembarco del rey",false,600,200,1.50,300,180)))
    @Casilla.push(Casilla.new.const2(15, TipoCasilla::JUEZ))
    @Casilla.push(Casilla.new.const1(16, TipoCasilla::CALLE, Titulo_propiedad.new("Rocadragon",false,500,165,1.35,250,120)))
    @Casilla.push(Casilla.new.const2(17, TipoCasilla::SORPRESA))
    @Casilla.push(Casilla.new.const1(18, TipoCasilla::CALLE, Titulo_propiedad.new("Bravos",false,550,170,1.35,275,120)))
    @Casilla.push(Casilla.new.const1(19, TipoCasilla::CALLE, Titulo_propiedad.new("Desembarco del rey",false,600,200,1.50,300,180)))
    
    @Carcel=@Casilla[5]
  end
  
  public
  @Overrride
  def to_s()
    return @Casilla[0..19].to_s()
  end
end
