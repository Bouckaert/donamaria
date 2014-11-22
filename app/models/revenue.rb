class Receita < ActiveRecord::Base
  belongs_to :candidatura

  require 'csv'

# >>>> csv de 2010 não possui campo sequencial_candidato será necessario alterar modelos acrescentando CPF / Problemas no encoding do arquivo "invalid byte sequence in UTF-8"

  def self.import
#   CSV.foreach("public/prestacao_contas_2010/candidato/PE/ReceitasCandidatos.txt", :encoding => 'windows-1252:utf-8', headers: true, :col_sep => ';' ) do |row|

#     receita_hash = row.to_hash
#     receita = Receita.where(numero_recibo_eleitoral: receita_hash["Numero Recibo Eleitoral"])
#     @candidatura = Candidatura.where(sequencial_candidato: row["Sequencial Candidato"])

#     Receita.create!(:sequencial_candidato => row["Sequencial Candidato"],:numero_recibo_eleitoral => row["Numero Recibo Eleitoral"], :nome_doador => row["Nome do doador"], :valor_receita => row["Valor receita"].gsub(',', '.').to_d, :descricao_da_receita => row["Descricao da receita"],:candidatura_id => @candidatura.first.id)
#   end # end CSV.foreach

#    CSV.foreach("public/prestacao_contas_2012/candidato/PE/ReceitasCandidatos.txt", :encoding => 'latin1:utf-8', headers: true, :col_sep => '#;' ) do |row|
#
#      @candidatura = Candidatura.where(sequencial_candidato: row["Sequencial Candidato"])
#
#      Receita.create!(:sequencial_candidato => row["Sequencial Candidato"],:numero_recibo_eleitoral => row["Numero Recibo Eleitoral"], :#nome_doador => row["Nome do doador"], :valor_receita => row["Valor receita"].gsub(',', '.').to_d, :descricao_da_receita => row["#Descricao da receita"],:candidatura_id => @candidatura.first.id)
#    end # end CSV.foreach

    CSV.foreach("public/prestacao_contas_2014/candidato/PE/receitas_candidatos_2014_PE.txt", :encoding => 'windows-1252:utf-8', headers: true, :col_sep => ';' ) do |row|

      @candidatura = Candidatura.where(sequencial_candidato: row["Sequencial Candidato"])

      Receita.create!(:sequencial_candidato => row["Sequencial Candidato"],:numero_recibo_eleitoral => row["Numero Recibo Eleitoral"], :nome_doador => row["Nome do doador"], :valor_receita => row["Valor receita"].gsub(',', '.').to_d, :descricao_da_receita => row["Descricao da receita"],:candidatura_id => @candidatura.first.id)
    end # end CSV.foreach


  end # end self.import(file)

end
