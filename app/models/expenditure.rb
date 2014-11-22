class Expenditure < ActiveRecord::Base
  belongs_to :candidature

  require 'csv'

# >>>> csv de 2010 não possui campo sequencial_candidato será necessario alterar modelos acrescentando CPF / Problemas no encoding do arquivo "invalid byte sequence in UTF-8"
# def self.import
#   CSV.foreach("public/prestacao_contas_2010/candidato/PE/DespesasCandidatos.txt",:encoding => 'windows-1252:utf-8', headers: true, :col_sep => ';' ) do |row|

#     expenditure_hash = row.to_hash
#     @candidature = Candidature.where(election_year: "2010", numero_candidato: row["Número candidato"])
#     puts row["Número candidato"]
#     sleep(1)
#     Expenditure.create!(:sequencial_candidato => row["Número candidato"],:seller => row["Nome do fornecedor"], :price => row["Valor despesa"].gsub(',', '.').to_d, :description => row["Descricao da despesa"],:candidature_id => @candidature.first.id)

#   end # end CSV.foreach
# end # end self.import(file)

 def self.import
  CSV.foreach("public/prestacao_contas_2012/candidato/PE/DespesasCandidatos.txt",:encoding => 'latin1:utf-8', headers: true, :col_sep => ';' ) do |row|

    expenditure_hash = row.to_hash
    @candidature = Candidature.where(election_year: "2012", sequencial_candidato: row["Sequencial Candidato"])
    Expenditure.create!(:sequencial_candidato => row["Sequencial Candidato"],:seller => row["Nome do fornecedor"], :price => row["Valor despesa"].gsub(',', '.').to_d, :description => row["Descricao da despesa"],:candidature_id => @candidature.first.id)

  end # end CSV.foreach

   CSV.foreach("public/prestacao_contas_2014/candidato/PE/despesas_candidatos_2014_PE.txt",:encoding => 'windows-1252:utf-8', headers: true, :col_sep => ';' ) do |row|

     expenditure_hash = row.to_hash
     @candidature = Candidature.where(election_year: "2014", sequencial_candidato: row["Sequencial Candidato"])
     Expenditure.create!(:sequencial_candidato => row["Sequencial Candidato"],:seller => row["Nome do fornecedor"], :price => row["Valor despesa"].gsub(',', '.').to_d, :description => row["Descriçao da despesa"],:candidature_id => @candidature.first.id)

   end # end CSV.foreach

 end # end self.import(file)

end
