require 'csv'
require_relative 'model'

class Database

  attr_accessor :collection

  def initialize(file)
    @collection = []
    self.parseFile(file)
  end

  def parseFile(file)
    CSV.foreach(file) do |row|                                    #Scan do CSV
      @collection << Model.new(row[0], row[1].to_i())           #Adicionando itens do CSV
    end
  end

end
