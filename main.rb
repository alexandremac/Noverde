require_relative 'lib/database.rb'


#Contante para facilitar alterações na multa
MULTA = 5

def main(arq_contas, arq_transacoes)

  #Verificando existencia dos arquivos
  if (!File.exist?(arq_contas) || !File.exist?(arq_transacoes))
    puts "Arquivo #{arq_contas} não encontrado!" if !File.exist?(arq_contas)
    puts "Arquivo #{arq_transacoes} não encontrado!" if !File.exist?(arq_transacoes)
    exit
  end

  #Objeto que acumala os dados do CSV
  contas     = Database.new(arq_contas).collection
  transacoes = Database.new(arq_transacoes).collection

  #Loop para calcular e imprimir resultado
  contas.each do |conta|
    movs = transacoes.select { |mov|  mov.id == conta.id }
    movs.select{ |mov| conta.add(mov.value, MULTA)}
    puts conta.id + "," + conta.value.to_s
  end

end

#Executando função
main(ARGV[0] || "contas.csv", ARGV[1] || "transacoes.csv")
