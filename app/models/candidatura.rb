class Candidatura < ActiveRecord::Base
  belongs_to :candidato
  has_many :receitas
  has_many :despesas

  require 'csv'

  def self.import
  candidatura_hash = Array.new
  CSV.foreach("public/consulta_cand_2012_PE.txt",:encoding => 'windows-1251:utf-8', headers: false ,:col_sep => ';' ) do |row|
    candidatura_hash = row[11]
    candidatura = Candidatura.where(sequencial_candidato: candidatura_hash)

    if candidatura.count == 1
    candidatura.first.update_attributes(:ano_eleicao => row[2],:descricao_eleicao => row[4], :sigla_UF => row[5], :descricao_UE => row[7], :descricao_cargo => row[9], :numero_candidato => row[12], :sequencial_candidato => row[11], :sigla_partido => row[17], :composicao_legenda => row[21], :desc_sit_tot_turno => row[41])
    else
    Candidatura.create!(:ano_eleicao => row[2],:descricao_eleicao => row[4], :sigla_UF => row[5], :descricao_UE => row[7], :descricao_cargo => row[9], :numero_candidato => row[12], :sequencial_candidato => row[11], :sigla_partido => row[17], :composicao_legenda => row[21], :desc_sit_tot_turno => row[41])
    end # end if !candidatura.nil?

    end
  end

  def receita_total
    @receita_total ||= self.receitas.inject(0) {|sum, a| sum += a.valor_receita }
    return @receita_total
  end

  def despesa_total
    @despesa_total ||= self.despesas.inject(0) {|sum, a| sum += a.valor_despesa }
    return @despesa_total
  end
end
