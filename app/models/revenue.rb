class Revenue < ActiveRecord::Base
  belongs_to :candidature

  require 'csv'

# >>>> csv de 2010 não possui campo sequencial_candidato será necessario alterar modelos acrescentando CPF / Problemas no encoding do arquivo "invalid byte sequence in UTF-8"

  def self.import
   CSV.foreach("public/prestacao_contas_2010/candidato/PE/ReceitasCandidatos.txt", :encoding => 'latin1:utf-8', headers: true, :col_sep => ';' ) do |row|

     receita_hash = row.to_hash
     @receita = Revenue.where(receipt_title: receita_hash["Numero Recibo Eleitoral"])
     @candidature = Candidature.where(sequencial_candidato: row["Sequencial Candidato"])

     Revenue.create!(:sequencial_candidato => row["Sequencial Candidato"],:receipt_title => row["Numero Recibo Eleitoral"], :donator => row["Nome do doador"], :price => row["Valor receita"].gsub(',', '.').to_d, :description => row["Descricao da receita"],:candidature_id => @candidature.first.id)
    end # end CSV.foreach

#    CSV.foreach("public/prestacao_contas_2012/candidato/PE/RevenuesCandidatos.txt", :encoding => 'latin1:utf-8', headers: true, :col_sep => '#;' ) do |row|
#
#      @candidature = Candidature.where(sequencial_candidato: row["Sequencial Candidato"])
#
#      Revenue.create!(:sequencial_candidato => row["Sequencial Candidato"],:receipt_title => row["Numero Recibo Eleitoral"], :#donator => row["Nome do doador"], :price => row["Valor receita"].gsub(',', '.').to_d, :description => row["#Descricao da receita"],:candidature_id => @candidature.first.id)
#    end # end CSV.foreach

#   CSV.foreach("public/prestacao_contas_2014/candidato/PE/receitas_candidatos_2014_PE.txt", :encoding => 'windows-1252:utf-8', headers: true, :col_sep => ';' ) do |row|

#     @candidature = Candidature.where(sequencial_candidato: row["Sequencial Candidato"])

#     Revenue.create!(:sequencial_candidato => row["Sequencial Candidato"],:receipt_title => row["Numero Recibo Eleitoral"], :donator => row["Nome do doador"], :price => row["Valor receita"].gsub(',', '.').to_d, :description => row["Descricao da receita"],:candidature_id => @candidature.first.id)
#   end # end CSV.foreach


  end # end self.import(file)

end
