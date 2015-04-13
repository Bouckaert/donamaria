require 'rails_helper'

describe ProposalsController, type: :controller do
  describe "GET 'index'" do
    before { get :index }

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns proposals' do
      expect(assigns(:proposals)).to be
    end
  end

  describe "GET 'new'" do
    before { get :new }

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns new proposal' do
      expect(assigns(:proposal)).to be
    end
  end

  describe "POST 'create'" do
    before { post :create }

    it 'redirects' do
      expect(response).to be_redirect
    end
  end

  describe "GET 'show'" do
    let(:proposal) { FactoryGirl.create :proposal }

    before { get :show, id: proposal }

    xit 'returns http success' do
      expect(response).to be_success
    end

    xit 'assigns new proposal' do
      expect(assigns(:proposal)).to be
    end
  end

  describe "GET 'edit'" do
    let(:proposal) { FactoryGirl.create :proposal }

    before { get :edit, id: proposal }

    xit 'returns http success' do
      expect(response).to be_success
    end

    xit 'assigns new proposal' do
      expect(assigns(:proposal)).to be
    end
  end

  describe "PUT 'update'" do
    let(:proposal) { FactoryGirl.create :proposal }

    before { put :update, id: proposal, proposal: { title: 'Título da Proposta' } }

    skip 'does pretty nothing'
  end

  describe "DELETE 'destroy'" do
    let(:proposal) { FactoryGirl.create :proposal }

    before { delete :destroy, id: proposal }

    skip 'no redirecting neither rendering'
  end

  describe "GET 'upvote'" do
    let(:proposal) { FactoryGirl.create :proposal }

    before { get :upvote, id: proposal }

    it 'redirects' do
      expect(response).to be_redirect
    end
  end

  describe "GET 'downvote'" do
    let(:proposal) { FactoryGirl.create :proposal }

    before { get :downvote, id: proposal }

    it 'redirects' do
      expect(response).to be_redirect
    end
  end
end
