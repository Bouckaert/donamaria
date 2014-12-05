require 'rest_client'

namespace :consume do
  # desc 'Populate federative units'
  # task federative_units: :environment do
  #   federative_units = RestClient.get( "http://www.meucongressonacional.com/api/001/candidatos/2014")
  #   federative_units = "{\"federative_units\":#{federative_units}}"
  #   fus = FederativeUnitsRepresenter.new(Representable::FederativeUnit.new).from_json federative_units
  #   fus.to_a.each do |fu|
  #     puts fu.name
  #   end
  # end

  desc 'Populate candidates'
  task candidates: :environment do
    candidates = RestClient.get( "http://www.meucongressonacional.com/api/001/candidatos/2014")
    candidates = "{\"candidates\":#{candidates}}"
    cs = CandidatesRepresenter.new(Representable::Candidate.new).from_json candidates
    puts "Começando a salvar"
    cs.to_a.each do |c|
      c.save
    end
  end

  desc 'Populate candidatures'
  task candidatures: :environment do
    Candidate.all.each do |candidate|
      candidate.candidatures << Candidature.new(election_year: 2014)
      candidate.save
    end
  end

  desc 'Populate patrimonies'
  task patrimonies: :environment do
    Candidate.all.each do |candidate|
      patrimonies = RestClient.get( "http://www.meucongressonacional.com/api/001/candidato/2014/#{candidate.id}/bens")
      patrimonies = "{\"patrimonies\":#{patrimonies}}"
      patrimonies = PatrimoniesRepresenter.new(Representable::Patrimony.new).from_json patrimonies
      patrimonies.to_a.each do |patrimony|
        candidate.candidatures.first.patrimonies << patrimony
        candidate.save
      end
    end
  end

  desc 'Populate revenues'
  task revenues: :environment do
    Candidate.all.each do |candidate|
      revenues = RestClient.get( "http://www.meucongressonacional.com/api/001/candidato/2014/#{candidate.id}/doacoes")
      revenues = "{\"revenues\":#{revenues}}"
      revenues = RevenuesRepresenter.new(Representable::Revenue.new).from_json revenues
      revenues.to_a.try(:each) do |revenue|
        candidate.candidatures.first.revenues << revenue
        candidate.save
      end
    end
  end

  desc "Run all bootstrapping tasks"
  task all: [:candidates, :candidatures, :patrimonies, :revenues]
end
