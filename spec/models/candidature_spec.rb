require 'rails_helper'

describe Candidature do
  it { should respond_to :sequencial_candidato }
  it { should respond_to :election_year }
  it { should respond_to :election_description }
  it { should respond_to :federative_unit_symbol }
  it { should respond_to :federative_unit_description }
  it { should respond_to :job_title }
  it { should respond_to :candidate_number }
  it { should respond_to :political_party_symbol }
  it { should respond_to :political_caption }
  it { should respond_to :desc_sit_tot_turno }
  it { should belong_to :representative }
  it { should have_many :revenues }
  it { should have_many :expenditures }
  it { should have_many :patrimonies }
end
