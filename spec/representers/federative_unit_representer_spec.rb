require 'spec_helper'

describe FederativeUnitRepresenter do
  subject { described_class.new(federative_unit).to_hash }

  let(:federative_unit) do
    Representable::FederativeUnit.new(id: 1, symbol: 'pe', name: 'Pernambuco')
  end

  it 'includes #estadoId' do
    expect(subject).to have_key('estadoId')
  end

  it 'includes #sigla' do
    expect(subject).to have_key('sigla')
  end

  it 'includes #nome' do
    expect(subject).to have_key('nome')
  end
end
