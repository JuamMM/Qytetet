# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Dado
  
  require "singleton"
  include Singleton
  
  attr_accessor:valor
  
  def initialize
    @valor=0
  end
  
  def tirar
    @valor = rand(5)+1
    return @valor
  end
  
  def get_valor
    return @valor
  end
end
