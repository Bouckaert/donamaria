class Candidature < ActiveRecord::Base
  belongs_to :candidate
  has_many :revenues
  has_many :expenditures
  has_many :patrimonies

#  scope :ano_2012, -> { where(election_year: "2012")}

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

  def patrimony_by_gender(gender)
    candidato_masculino = Candidate.all.with_gender(gender)
    @patrimony_by_gender = 0
    puts candidato_masculino.count
    candidato_masculino.each do |cm|
      cm.candidatures.each do |cc|
        cc.patrimonies.each do |pp|
          @patrimony_by_gender = @patrimony_by_gender + pp.price
        end
      end
    end
    return @patrimony_by_gender
  end

  def self.import
  candidature_hash = Array.new
  CSV.foreach("public/consulta_cand_2010/consulta_cand_2010_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
    candidature_hash = row[11]
    candidature = Candidature.where(sequencial_candidato: candidature_hash)
    @candidate = Candidate.where(voter_registration: row[26])

    if candidature.count == 1
    candidature.first.update_attributes(:election_year => row[2],:election_description => row[4], :federative_unit_symbol => row[5], :federative_unit_description => row[7], :job_title => row[9], :candidate_number => row[12], :sequencial_candidato => row[11], :political_party_symbol => row[17], :political_caption => row[21], :desc_sit_tot_turno => row[41], :candidate_id => @candidate.first.id)
    else
    Candidature.create!(:election_year => row[2],:election_description => row[4], :federative_unit_symbol => row[5], :federative_unit_description => row[7], :job_title => row[9], :candidate_number => row[12], :sequencial_candidato => row[11], :political_party_symbol => row[17], :political_caption => row[21], :desc_sit_tot_turno => row[41], :candidate_id => @candidate.first.id)
    end # end if !candidature.nil?

    end

 CSV.foreach("public/consulta_cand_2012/consulta_cand_2012_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
   candidature_hash = row[11]
   @candidate = Candidate.where(voter_registration: row[26])

   Candidature.create!(:election_year => row[2],:election_description => row[4], :federative_unit_symbol => row[5], :federative_unit_description => row[7], :job_title => row[9], :candidate_number => row[12], :sequencial_candidato => row[11], :political_party_symbol => row[17], :political_caption => row[21], :desc_sit_tot_turno => row[41], :candidate_id => @candidate.first.id)
   end

  CSV.foreach("public/consulta_cand_2014/consulta_cand_2014_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
    candidature_hash = row[11]
    @candidate = Candidate.where(voter_registration: row[26])

    Candidature.create!(:election_year => row[2],:election_description => row[4], :federative_unit_symbol => row[5], :federative_unit_description => row[7], :job_title => row[9], :candidate_number => row[12], :sequencial_candidato => row[11], :political_party_symbol => row[17], :political_caption => row[21], :desc_sit_tot_turno => row[42], :candidate_id => @candidate.first.id)
    end

  end

end
