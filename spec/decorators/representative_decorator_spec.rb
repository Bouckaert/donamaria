require 'spec_helper'

describe RepresentativeDecorator do
  let(:representative) { FactoryGirl.create :representative }

  subject { representative.decorate }

  describe 'supporters_count' do

    context 'when representative has no proposals' do
      it 'returns no proposals yet text' do
        expect(subject.supporters_count).to eq "Nenhuma proposta ainda!"
      end
    end

    context 'when representative has proposals' do
      let(:user) { FactoryGirl.create :user }
      let(:proposals) do
        FactoryGirl.create_list :proposal, 2, representative: representative
      end
      let(:supporters_count) do
        proposals.flat_map(&:get_upvotes).map(&:voter_id).uniq.count
      end

      before { proposals.each { |p| p.upvote_by user } }

      it 'returns sum of all representative proposals score' do
        expect(subject.supporters_count).to eq supporters_count
      end
    end
  end
end
