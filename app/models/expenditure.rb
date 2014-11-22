class Despesa < ActiveRecord::Base
  belongs_to :candidatura

  require 'csv'

# >>>> csv de 2010 não possui campo sequencial_candidato será necessario alterar modelos acrescentando CPF / Problemas no encoding do arquivo "invalid byte sequence in UTF-8"
# def self.import
#   CSV.foreach("public/prestacao_contas_2010/candidato/PE/DespesasCandidatos.txt",:encoding => 'windows-1252:utf-8', headers: true, :col_sep => ';' ) do |row|

#     despesa_hash = row.to_hash
#     @candidatura = Candidatura.where(ano_eleicao: "2010", numero_candidato: row["Número candidato"])
#     puts row["Número candidato"]
#     sleep(1)
#     Despesa.create!(:sequencial_candidato => row["Número candidato"],:nome_fornecedor => row["Nome do fornecedor"], :valor_despesa => row["Valor despesa"].gsub(',', '.').to_d, :descricao_despesa => row["Descricao da despesa"],:candidatura_id => @candidatura.first.id)

#   end # end CSV.foreach
# end # end self.import(file)

 def self.import
  CSV.foreach("public/prestacao_contas_2012/candidato/PE/DespesasCandidatos.txt",:encoding => 'latin1:utf-8', headers: true, :col_sep => ';' ) do |row|

    despesa_hash = row.to_hash
    @candidatura = Candidatura.where(ano_eleicao: "2012", sequencial_candidato: row["Sequencial Candidato"])
    Despesa.create!(:sequencial_candidato => row["Sequencial Candidato"],:nome_fornecedor => row["Nome do fornecedor"], :valor_despesa => row["Valor despesa"].gsub(',', '.').to_d, :descricao_despesa => row["Descricao da despesa"],:candidatura_id => @candidatura.first.id)

  end # end CSV.foreach

   CSV.foreach("public/prestacao_contas_2014/candidato/PE/despesas_candidatos_2014_PE.txt",:encoding => 'windows-1252:utf-8', headers: true, :col_sep => ';' ) do |row|

     despesa_hash = row.to_hash
     @candidatura = Candidatura.where(ano_eleicao: "2014", sequencial_candidato: row["Sequencial Candidato"])
     Despesa.create!(:sequencial_candidato => row["Sequencial Candidato"],:nome_fornecedor => row["Nome do fornecedor"], :valor_despesa => row["Valor despesa"].gsub(',', '.').to_d, :descricao_despesa => row["Descriçao da despesa"],:candidatura_id => @candidatura.first.id)

   end # end CSV.foreach

 end # end self.import(file)

end
