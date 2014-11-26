class Patrimony < ActiveRecord::Base
  belongs_to :candidature

  require 'csv'

 def self.import
 patrimony_hash = Array.new
 CSV.foreach("public/bem_candidato_2010/bem_candidato_2010_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
   patrimony_hash = row[5]
   @candidature = Candidature.where(sequencial_candidato: patrimony_hash)

   Patrimony.create!(:sequencial_candidato => row[5],:description => row[8], :price => row[9],:candidature_id => @candidature.first.id)

   end
 end

  def self.import
  patrimony_hash = Array.new
  CSV.foreach("public/bem_candidato_2012/bem_candidato_2012_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
    patrimony_hash = row[5]
    @candidature = Candidature.where(sequencial_candidato: patrimony_hash, election_year: "2012")

    Patrimony.create!(:sequencial_candidato => row[5],:description => row[8], :price => row[9],:candidature_id => @candidature.first.id)

    end
  end

  def self.import
  patrimony_hash = Array.new
  CSV.foreach("public/bem_candidato_2014/bem_candidato_2014_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
    patrimony_hash = row[5]
    @candidature = Candidature.where(sequencial_candidato: patrimony_hash, election_year: "2014")

    Patrimony.create!(:sequencial_candidato => row[5],:description => row[8], :price => row[9],:candidature_id => @candidature.first.id)

    end
  end

end
