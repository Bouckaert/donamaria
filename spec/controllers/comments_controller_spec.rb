require 'spec_helper'

describe CommentsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:proposal) { FactoryGirl.create :proposal }

  before { sign_in user }

  describe "GET 'index'" do
    before { get :index, proposal_id: proposal }

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns proposal, user, comments and candidature' do
      %i(proposal user comments candidature).each do |variable_name|
        expect(assigns(variable_name)).to be
      end
    end
  end

  describe "GET 'new'" do
    before { get :new, proposal_id: proposal }

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns a new comment' do
      expect(assigns(:comment)).to be
    end
  end

  describe "POST 'create'" do
    let(:comment_attributes) { FactoryGirl.attributes_for :comment }

    before { post :create, proposal_id: proposal, comment: comment_attributes }

    it 'assigns proposal, user and comment' do
      %i(proposal user comment).each do |variable_name|
        expect(assigns(variable_name)).to be
      end
    end

    context 'with valid attributes' do
      it 'redirects to representative view page' do
        expect(response).to redirect_to representative_path(proposal.representative)
      end
    end
  end
end
