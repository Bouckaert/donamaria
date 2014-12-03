class Candidate < ActiveRecord::Base
  has_many :candidatures
  belongs_to :user

  scope :with_name, -> (name) { where("name like ?", "%#{name}%")}
  scope :with_gender, -> (gender) { where("gender like ?", "%#{gender}%")}

  require 'csv'

  def self.search(name)
    where("name like ?", "%#{name}%")
  end

  def self.import
    candidate_hash = Array.new
   CSV.foreach("public/consulta_cand_2010/consulta_cand_2010_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
     candidate_hash = row[26]
     candidate = Candidate.where(voter_registration: candidate_hash)

     if candidate.count == 1
     candidate.first.update_attributes(:occupation => row[24],:voter_registration => row[26], :name => row[10], :gender => row[29])
     else
     Candidate.create!(:occupation => row[24],:voter_registration => row[26], :name => row[10], :gender => row[29])
     end # end if !candidate.nil?
   end

   CSV.foreach("public/consulta_cand_2012/consulta_cand_2012_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
     candidate_hash = row[26]
     candidate = Candidate.where(voter_registration: candidate_hash)

     if candidate.count == 1
     candidate.first.update_attributes(:occupation => row[24],:voter_registration => row[26], :name => row[10], :gender => row[29])
     else
     Candidate.create!(:occupation => row[24],:voter_registration => row[26], :name => row[10], :gender => row[29])
     end # end if !candidate.nil?
   end

    CSV.foreach("public/consulta_cand_2014/consulta_cand_2014_PE.txt",:encoding => 'windows-1252:utf-8', headers: false ,:col_sep => ';' ) do |row|
      candidate_hash = row[26]
      candidate = Candidate.where(voter_registration: candidate_hash)

      if candidate.count == 1
      candidate.first.update_attributes(:occupation => row[24],:voter_registration => row[26], :name => row[10], :gender => row[29])
      else
      Candidate.create!(:occupation => row[24],:voter_registration => row[26], :name => row[10], :gender => row[29])
      end # end if !candidate.nil?
    end

  end

end
