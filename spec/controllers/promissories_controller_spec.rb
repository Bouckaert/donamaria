require 'rails_helper'

describe PromissoriesController, type: :controller do
  let(:user) { FactoryGirl.create :user, phone: phone }
  let(:proposal) { FactoryGirl.create :proposal }
  let!(:address) { FactoryGirl.create :address, user: user }
  let(:phone) { Faker::PhoneNumber.phone_number }

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

    context 'when current user has no' do

      context 'address' do
        let(:address) { nil }

        it 'redirects to edit user page' do
          expect(response).to redirect_to(edit_user_path(user))
        end
      end

      context 'phone' do
        let(:phone) { nil }

        it 'redirects to edit user page' do
          expect(response).to redirect_to(edit_user_path(user))
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
