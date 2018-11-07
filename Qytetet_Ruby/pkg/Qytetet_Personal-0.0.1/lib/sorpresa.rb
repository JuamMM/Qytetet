# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Sorpresa
  attr_accessor:texto
  attr_accessor:tipo
  attr_accessor:valor
  def initialize(unString,unTipoSorpresa,unInt)
    @texto=unString
    @tipo=unTipoSorpresa
    @valor=unInt
  end
  
  @Overrride
  def to_s()
    return "Texto: #{@texto}\n"\
           "Valor: #{@valor}\n"\
           "Tipo: #{@tipo}\n\n"
  end
  
  def get_texto()
    return @texto
  end
  
  def get_tipo()
    return @tipo
  end
  
  def get_valor()
    return @valor
  end
end
