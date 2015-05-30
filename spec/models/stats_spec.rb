require 'rails_helper'

RSpec.describe Stats, type: :model do
  it { should respond_to :name }
  it { should respond_to :mapping }
  it { should serialize(:mapping).as(ActiveSupport::HashWithIndifferentAccess) }

  describe 'mapping key' do
    let(:subject) { described_class.new name: name }
    let(:name) { 'Stats Testing' }
    let(:mapping_key) { :key }
    let(:mapping_value) { 'value' }

    before { subject.mapping[mapping_key] = mapping_value }

    describe 'automatically assigned dynamic field' do

      it 'is accessible via direct call' do
        expect(subject.public_send(mapping_key)).to eq(mapping_value)
      end

      it 'returns true if asked to #respond_to?' do
        expect(subject.respond_to?(mapping_key)).to be
      end

      it 'returns method when asked for #method' do
        expect(subject.method(mapping_key)).to be_a(Method)
      end
    end
  end
end
