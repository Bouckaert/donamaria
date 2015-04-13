require 'rails_helper'

shared_context 'with representable patrimony' do
  let(:patrimony) do
    Representable::Patrimony.new(description: 'Descrição do patrimônio ou bem',
      price: 200123.32)
  end
end

describe MCN::PatrimonyRepresenters::PatrimonyRepresenter do
  subject { described_class.new(patrimony).to_hash }
  include_context 'with representable patrimony'

  it 'includes key descricaoBem' do
    expect(subject).to have_key('descricaoBem')
  end

  it 'includes key valorBem' do
    expect(subject).to have_key('valorBem')
  end
end

describe MCN::PatrimonyRepresenters::PatrimoniesRepresenter do
  subject { described_class.new(patrimonies).to_hash }
  include_context 'with representable patrimony'

  let(:patrimonies) { [patrimony] }

  it 'returns array' do
    expect(subject['patrimonies']).to be_kind_of Array
  end
end
