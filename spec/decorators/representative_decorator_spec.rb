require 'rails_helper'

describe RepresentativeDecorator do
  let(:representative) { FactoryGirl.create :representative }
  let(:proposals) do
    FactoryGirl.create_list :proposal, 2, representative: representative
  end

  subject { representative.decorate }

  describe 'supporters_count' do

    context 'when representative has no proposals' do
      it 'returns no proposals yet text' do
        expect(subject.supporters_count).to eq "Nenhum apoiador ainda!"
      end
    end

    context 'when representative has proposals' do
      let(:user) { FactoryGirl.create :user }
      let(:supporters_count) do
        proposals.flat_map(&:get_upvotes).map(&:voter_id).uniq.count
      end

      before { proposals.each { |p| p.upvote_by user } }

      it 'returns sum of all representative proposals score' do
        expect(subject.supporters_count).to eq supporters_count
      end
    end
  end

  describe 'proposals_titles' do

    context 'when representative has no proposals' do
      it 'returns no proposals yet text' do
        expect(subject.proposals_titles).to eq "Nenhuma proposta ainda!"
      end
    end

    context 'when representative has proposals' do
      let(:proposals_titles) { proposals.map(&:title) }

      before { proposals }

      it 'matches all proposals titles' do
        proposals_titles.each do |title|
          expect(subject.proposals_titles).to match(title)
        end
      end

      it 'returns an anchor for each title' do
        anchors = subject.proposals_titles.split(' ').select { |e| e == '<a' }
        expect(anchors.count).to eq(proposals.length)
      end
    end
  end

  describe 'supporters_id' do

    context 'when representative has no proposals' do
      it 'returns no proposals yet text' do
        expect(subject.supporters_id).to eq "Nenhum apoiador ainda!"
      end
    end

    context 'when representative has proposals' do
      let(:user) { FactoryGirl.create :user }
      let(:supporters_ids) do
        proposals.flat_map(&:get_upvotes).map(&:voter_id).uniq
      end

      before { proposals.each { |p| p.upvote_by user } }

      it 'matches all supporters id' do
        supporters_ids.each do |id|
          expect(subject.supporters_id).to match(id.to_s)
        end
      end

      it 'returns an anchor for each supporter id' do
        anchors = subject.supporters_id.split(' ').select { |e| e == '<a' }
        expect(anchors.count).to eq(supporters_ids.length)
      end
    end
  end
end
