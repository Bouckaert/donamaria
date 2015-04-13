require 'rails_helper'

shared_context 'with representable revenue' do
  let(:revenue) do
    Representable::Revenue.new(donator: 'José da Silva', price: 200123.32,
      description: 'Descrição da receita')
  end
end

describe MCN::RevenueRepresenters::RevenueRepresenter do
  subject { described_class.new(revenue).to_hash }
  include_context 'with representable revenue'

  it 'includes key nomeDoador' do
    expect(subject).to have_key('nomeDoador')
  end

  it 'includes key valor' do
    expect(subject).to have_key('valor')
  end

  it 'includes key tipoReceita' do
    expect(subject).to have_key('tipoReceita')
  end
end

describe MCN::RevenueRepresenters::RevenuesRepresenter do
  subject { described_class.new(revenues).to_hash }
  include_context 'with representable revenue'

  let(:revenues) { [revenue] }

  it 'returns array' do
    expect(subject['revenues']).to be_kind_of Array
  end
end
