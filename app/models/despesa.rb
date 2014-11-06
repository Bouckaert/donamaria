class Despesa < ActiveRecord::Base
  belongs_to :candidatura

  require 'csv'

  def self.import
    CSV.foreach("public/DespesasCandidatos.txt", headers: true, :col_sep => ';' ) do |row|

      despesa_hash = row.to_hash
      @candidatura = Candidatura.where(sequencial_candidato: row["Sequencial Candidato"])
      Despesa.create!(:sequencial_candidato => row["Sequencial Candidato"],:nome_fornecedor => row["Nome do fornecedor"], :valor_despesa => row["Valor despesa"].gsub(',', '.').to_d, :descricao_despesa => row["Descricao da despesa"],:candidatura_id => @candidatura.first.id)

    end # end CSV.foreach
  end # end self.import(file)

end
