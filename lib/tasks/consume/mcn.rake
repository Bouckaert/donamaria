require 'rest_client'

namespace :consume do

  namespace :mcn do
    def url(request_path)
      "http://www.meucongressonacional.com/api/001/#{request_path}"
    end

    def get(request_path)
      RestClient.get url(request_path)
    end

    def fetch_and_parse(request_path, klass)
      include "MCN::#{klass}Representers".constantize

      objects = get request_path
      objects = "{\"#{klass.pluralize.downcase}\":#{objects}}"
      representable = "Representable::#{klass}".constantize.new
      representer = "#{klass.pluralize}Representer".constantize.new representable

      representer.from_json objects
    end

    desc 'Populate candidates'
    task candidates: :environment do
      candidates = fetch_and_parse 'candidatos/2014', 'Candidate'
      candidates.to_a.map(&:save)
    end

    desc 'Populate candidatures'
    task candidatures: :environment do
      Candidate.find_each do |candidate|
        candidate.candidatures << Candidature.new(election_year: 2014)
        candidate.save
      end
    end

    desc 'Populate patrimonies'
    task patrimonies: :environment do
      Candidate.all.each do |candidate|
        patrimonies = fetch_and_parse "candidato/2014/#{candidate.voter_registration}/bens",
                                      'Patrimony'
        patrimonies.to_a.each do |patrimony|
          candidate.candidatures.first.patrimonies << patrimony
          candidate.save
        end
      end
    end

    desc 'Populate revenues'
    task revenues: :environment do
      Candidate.all.each do |candidate|
        revenues = fetch_and_parse "candidato/2014/#{candidate.voter_registration}/doacoes",
                                   'Revenue'
        revenues.to_a.try(:each) do |revenue|
          candidate.candidatures.first.revenues << revenue
          candidate.save
        end
      end
    end

    desc "Run all population tasks"
    task all: [:candidates, :candidatures, :patrimonies, :revenues]
  end
end
