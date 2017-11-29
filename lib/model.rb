class Model
  attr_accessor :id
  attr_accessor :value

  def initialize(id, value=0)                 #inicializando objeto com ID e valor inicial
    @id = id
    @value = value
  end

  
  def add(value = 0, multa = 0)
    @value += value                                            #add valor a conta do cliente
    @value -= ((@value < 0) && (value < 0))? multa.to_i(): 0   #Aplica multa caso necessite
  end

end
