class Patrimonio < ActiveRecord::Base
  belongs_to :candidatura

  require 'csv'

  def self.import
  patrimonio_hash = Array.new
  CSV.foreach("public/bem_candidato_2012_PE.txt",:encoding => 'windows-1251:utf-8', headers: false ,:col_sep => ';' ) do |row|
    patrimonio_hash = row[5]
    patrimonio = Patrimonio.where(sequencial_candidato: patrimonio_hash)
    @candidatura = Candidatura.where(sequencial_candidato: patrimonio_hash)


    if patrimonio.count == 1
    patrimonio.first.update_attributes(:sequencial_candidato => row[5],:detalhe_bem => row[8], :valor_bem => row[9],:candidatura_id => @candidatura.first.id)
    else
    Patrimonio.create!(:sequencial_candidato => row[5],:detalhe_bem => row[8], :valor_bem => row[9],:candidatura_id => @candidatura.first.id)
    end # end if !patrimonio.nil?

    end
  end

end
