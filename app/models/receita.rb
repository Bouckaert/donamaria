class Receita < ActiveRecord::Base
  belongs_to :candidatura

  require 'csv'

  def self.import
    CSV.foreach("public/Receita.txt", headers: true, :col_sep => ';' ) do |row|

      receita_hash = row.to_hash
puts receita_hash["Valor receita"].gsub(',', '.').to_d
      receita = Receita.where(numero_recibo_eleitoral: receita_hash["Numero Recibo Eleitoral"])
      if receita.count == 1
        receita.first.update_attributes(:sequencial_candidato => row["Sequencial Candidato"],:numero_recibo_eleitoral => row["Numero Recibo Eleitoral"], :nome_doador => row["Nome do doador"], :valor_receita => row["Valor receita"].gsub(',', '.').to_d, :descricao_da_receita => row["Descricao da receita"])
      else
        Receita.create!(:sequencial_candidato => row["Sequencial Candidato"],:numero_recibo_eleitoral => row["Numero Recibo Eleitoral"], :nome_doador => row["Nome do doador"], :valor_receita => row["Valor receita"].gsub(',', '.').to_d, :descricao_da_receita => row["Descricao da receita"])
      end # end if !receita.nil?
    end # end CSV.foreach
  end # end self.import(file)

end
