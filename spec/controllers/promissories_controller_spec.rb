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

  describe 'GET preview' do
    let(:promissory) { FactoryGirl.attributes_for :promissory }

    before { get :preview, proposal_id: proposal, promissory: promissory }

    it 'responds with success' do
      expect(response).to be_success
    end

    it 'renders preview' do
      expect(response).to render_template(:preview)
    end
  end

  describe 'POST create' do
    let(:params) { Hash(proposal_id: proposal, promissory: promissory) }
    let(:promissory) { FactoryGirl.attributes_for :promissory, amount: amount }
    let(:amount) { Faker::Number.decimal(2) }

    it 'responds redirects to user page' do
      post :create, params
      expect(response).to redirect_to user
    end

    it 'creates a new promissory' do
      expect {
        post :create, params
      }.to change(Promissory, :count).by(1)
    end

    context 'with invalid amount' do
      let(:amount) { nil }

      it 'does not create a new promissory' do
        expect {
          post :create, params
        }.to change(Promissory, :count).by(0)
      end
    end
  end
end
