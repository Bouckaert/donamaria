require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create :user }

  describe "GET show" do
    before { get :show, id: user }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    let(:session_user) { user }

    before do
      sign_in session_user if session_user
      get :edit, id: user
    end

    it 'renders edit' do
      expect(response).to render_template(:edit)
    end

    context 'when user is not authenticated' do
      let(:session_user) { nil }

      it 'redirects' do
        expect(response).to redirect_to(user_path)
      end
    end

    context 'when trying to edit a different user' do
      let(:session_user) { FactoryGirl.create :user }

      it 'redirects' do
        expect(response).to redirect_to(user_path)
      end
    end
  end

  describe "POST update" do
    let(:user) { FactoryGirl.create :user }
    let(:email) { Faker::Internet.email }

    before { post :update, id: user, user: { email: email } }

    it 'assigns user' do
      expect(assigns(:user)).to be
    end

    it 'sets flash message' do
      expect(flash[:success]).to be_present
    end

    it 'redirects to user page' do
      expect(response).to redirect_to user
    end
  end
end
