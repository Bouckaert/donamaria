class Candidato < ActiveRecord::Base
  has_many :candidaturas
  belongs_to :user

  scope :with_nome, -> (nome) { where("nome_candidato like ?", "%#{nome}%")}
  scope :with_sexo, -> (sexo) { where("descricao_sexo like ?", "%#{sexo}%")}

  require 'csv'

  def self.import
    candidato_hash = Array.new
   CSV.foreach("public/consulta_cand_2010/consulta_cand_2010_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
     candidato_hash = row[26]
     candidato = Candidato.where(numero_titulo_eleitor: candidato_hash)

     if candidato.count == 1
     candidato.first.update_attributes(:descricao_ocupacao => row[24],:numero_titulo_eleitor => row[26], :nome_candidato => row[10], :descricao_sexo => row[29])
     else
     Candidato.create!(:descricao_ocupacao => row[24],:numero_titulo_eleitor => row[26], :nome_candidato => row[10], :descricao_sexo => row[29])
     end # end if !candidato.nil?
   end

   CSV.foreach("public/consulta_cand_2012/consulta_cand_2012_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
     candidato_hash = row[26]
     candidato = Candidato.where(numero_titulo_eleitor: candidato_hash)

     if candidato.count == 1
     candidato.first.update_attributes(:descricao_ocupacao => row[24],:numero_titulo_eleitor => row[26], :nome_candidato => row[10], :descricao_sexo => row[29])
     else
     Candidato.create!(:descricao_ocupacao => row[24],:numero_titulo_eleitor => row[26], :nome_candidato => row[10], :descricao_sexo => row[29])
     end # end if !candidato.nil?
   end

    CSV.foreach("public/consulta_cand_2014/consulta_cand_2014_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
      candidato_hash = row[26]
      candidato = Candidato.where(numero_titulo_eleitor: candidato_hash)

      if candidato.count == 1
      candidato.first.update_attributes(:descricao_ocupacao => row[24],:numero_titulo_eleitor => row[26], :nome_candidato => row[10], :descricao_sexo => row[29])
      else
      Candidato.create!(:descricao_ocupacao => row[24],:numero_titulo_eleitor => row[26], :nome_candidato => row[10], :descricao_sexo => row[29])
      end # end if !candidato.nil?
    end

  end

end
