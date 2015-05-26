require 'rails_helper'

describe PromissoriesController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:proposal) { FactoryGirl.create :proposal }

  before { sign_in user }

  describe 'GET new' do
    before { get :new, proposal_id: proposal }

    it 'responds with success' do
      expect(response).to be_success
    end

    it 'assigns promissory' do
      expect(assigns(:promissory)).to be_a_new(Promissory)
    end

    it 'assigns proposal' do
      expect(assigns(:proposal)).to eq proposal
    end

    it 'assigns representative' do
      expect(assigns(:representative)).to eq proposal.representative
    end

    describe 'assigned promissory\'s' do
      let(:promissory) { assigns(:promissory) }

      describe 'user' do

        it 'matches current user' do
          expect(promissory.user).to eq user
        end
      end

      describe 'proposal' do

        it 'matches assigned proposal' do
          expect(promissory.proposal).to eq proposal
        end
      end
    end
  end
end
