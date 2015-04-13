require 'rails_helper'

shared_context 'with representable candidate' do
  let(:candidate) do
    Representable::Candidate.new(mcn_id: 1, name: 'Dona Maria',
      gender: 'FEMININO', occupation: 'Jornalista')
  end
end

describe MCN::CandidateRepresenters::CandidateRepresenter do
  subject { described_class.new(candidate).to_hash }
  include_context 'with representable candidate'

  it 'includes key mcn_id' do
    expect(subject).to have_key('id')
  end

  it 'includes key nomeCompleto' do
    expect(subject).to have_key('nomeCompleto')
  end

  it 'includes key sexo' do
    expect(subject).to have_key('sexo')
  end

  it 'includes key nomeOcupacao' do
    expect(subject).to have_key('nomeOcupacao')
  end
end

describe MCN::CandidateRepresenters::CandidatesRepresenter do
  subject { described_class.new(candidates).to_hash }
  include_context 'with representable candidate'

  let(:candidates) { [candidate] }

  it 'returns array' do
    expect(subject['candidates']).to be_kind_of Array
  end
end
