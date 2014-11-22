class Patrimonio < ActiveRecord::Base
  belongs_to :candidatura

  require 'csv'

 def self.import
 patrimonio_hash = Array.new
 CSV.foreach("public/bem_candidato_2010/bem_candidato_2010_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
   patrimonio_hash = row[5]
   @candidatura = Candidatura.where(sequencial_candidato: patrimonio_hash)

   Patrimonio.create!(:sequencial_candidato => row[5],:detalhe_bem => row[8], :valor_bem => row[9],:candidatura_id => @candidatura.first.id)

   end
 end

  def self.import
  patrimonio_hash = Array.new
  CSV.foreach("public/bem_candidato_2012/bem_candidato_2012_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
    patrimonio_hash = row[5]
    @candidatura = Candidatura.where(sequencial_candidato: patrimonio_hash, ano_eleicao: "2012")

    Patrimonio.create!(:sequencial_candidato => row[5],:detalhe_bem => row[8], :valor_bem => row[9],:candidatura_id => @candidatura.first.id)

    end
  end

  def self.import
  patrimonio_hash = Array.new
  CSV.foreach("public/bem_candidato_2014/bem_candidato_2014_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
    patrimonio_hash = row[5]
    @candidatura = Candidatura.where(sequencial_candidato: patrimonio_hash, ano_eleicao: "2014")

    Patrimonio.create!(:sequencial_candidato => row[5],:detalhe_bem => row[8], :valor_bem => row[9],:candidatura_id => @candidatura.first.id)

    end
  end

end
