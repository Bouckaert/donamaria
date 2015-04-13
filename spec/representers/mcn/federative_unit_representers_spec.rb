require 'rails_helper'

shared_context 'with representable federative unit' do
  let(:federative_unit) do
    Representable::FederativeUnit.new(id: 1, symbol: 'pe', name: 'Pernambuco')
  end
end

describe MCN::FederativeUnitRepresenters::FederativeUnitRepresenter do
  subject { described_class.new(federative_unit).to_hash }
  include_context 'with representable federative unit'

  it 'includes key estadoId' do
    expect(subject).to have_key('estadoId')
  end

  it 'includes key sigla' do
    expect(subject).to have_key('sigla')
  end

  it 'includes key nome' do
    expect(subject).to have_key('nome')
  end
end

describe MCN::FederativeUnitRepresenters::FederativeUnitsRepresenter do
  subject { described_class.new(federative_units).to_hash }
  include_context 'with representable federative unit'

  let(:federative_units) { [federative_unit] }

  it 'returns array' do
    expect(subject['federative_units']).to be_kind_of Array
  end
end
