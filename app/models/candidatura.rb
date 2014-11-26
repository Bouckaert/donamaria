class Candidatura < ActiveRecord::Base
  belongs_to :candidato
  has_many :receitas
  has_many :despesas
  has_many :patrimonios

  scope :ano_candidatura, -> (ano) { where("ano_eleicao like ?" "%#{ano}%")}

  require 'csv'

  def receita_total
    @receita_total ||= self.receitas.inject(0) {|sum, a| sum += a.valor_receita }
    return @receita_total
  end

  def despesa_total
    @despesa_total ||= self.despesas.inject(0) {|sum, a| sum += a.valor_despesa }
    return @despesa_total
  end

  def patrimonio_total
    @patrimonio_total ||= self.patrimonios.inject(0) {|sum, a| sum += a.valor_bem }
    return @patrimonio_total
  end

#Total gambiarra... Péssimo Desempenho
  def patrimonio_por_genero(sexo)
    candidato_genero = Candidato.all.with_sexo(sexo)
    @patrimonio_por_genero = 0
    candidato_genero.each do |cg|
      cg.candidaturas.each do |c|
        c.patrimonios.each do |p|
          @patrimonio_por_genero = @patrimonio_por_genero + p.valor_bem
        end
      end
    end
    return @patrimonio_por_genero
  end

  def receita_por_genero(sexo)
    receita_genero = Candidato.all.with_sexo(sexo)
    @receita_por_genero = 0
    receita_genero.each do |rg|
      rg.candidaturas.each do |c|
        c.receitas.each do |r|
          @receita_por_genero = @receita_por_genero + r.valor_receita
        end
      end
    end
    return @receita_por_genero
  end

    def despesa_por_genero(sexo)
    despesa_genero = Candidato.all.with_sexo(sexo)
    @despesa_por_genero = 0
    despesa_genero.each do |dg|
      dg.candidaturas.each do |c|
        c.despesas.each do |d|
          @despesa_por_genero = @despesa_por_genero + d.valor_despesa
        end
      end
    end
    return @despesa_por_genero
  end

  def self.import
  candidatura_hash = Array.new
  CSV.foreach("public/consulta_cand_2010/consulta_cand_2010_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
    candidatura_hash = row[11]
    candidatura = Candidatura.where(sequencial_candidato: candidatura_hash)
    @candidato = Candidato.where(numero_titulo_eleitor: row[26])

    if candidatura.count == 1
    candidatura.first.update_attributes(:ano_eleicao => row[2],:descricao_eleicao => row[4], :sigla_UF => row[5], :descricao_UE => row[7], :descricao_cargo => row[9], :numero_candidato => row[12], :sequencial_candidato => row[11], :sigla_partido => row[17], :composicao_legenda => row[21], :desc_sit_tot_turno => row[41], :candidato_id => @candidato.first.id)
    else
    Candidatura.create!(:ano_eleicao => row[2],:descricao_eleicao => row[4], :sigla_UF => row[5], :descricao_UE => row[7], :descricao_cargo => row[9], :numero_candidato => row[12], :sequencial_candidato => row[11], :sigla_partido => row[17], :composicao_legenda => row[21], :desc_sit_tot_turno => row[41], :candidato_id => @candidato.first.id)
    end # end if !candidatura.nil?

    end

 CSV.foreach("public/consulta_cand_2012/consulta_cand_2012_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
   candidatura_hash = row[11]
   @candidato = Candidato.where(numero_titulo_eleitor: row[26])

   Candidatura.create!(:ano_eleicao => row[2],:descricao_eleicao => row[4], :sigla_UF => row[5], :descricao_UE => row[7], :descricao_cargo => row[9], :numero_candidato => row[12], :sequencial_candidato => row[11], :sigla_partido => row[17], :composicao_legenda => row[21], :desc_sit_tot_turno => row[41], :candidato_id => @candidato.first.id)
   end

  CSV.foreach("public/consulta_cand_2014/consulta_cand_2014_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
    candidatura_hash = row[11]
    @candidato = Candidato.where(numero_titulo_eleitor: row[26])

    Candidatura.create!(:ano_eleicao => row[2],:descricao_eleicao => row[4], :sigla_UF => row[5], :descricao_UE => row[7], :descricao_cargo => row[9], :numero_candidato => row[12], :sequencial_candidato => row[11], :sigla_partido => row[17], :composicao_legenda => row[21], :desc_sit_tot_turno => row[42], :candidato_id => @candidato.first.id)
    end

  end

end
