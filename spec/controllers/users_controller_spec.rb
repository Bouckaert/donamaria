require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET show" do
    let(:user) { FactoryGirl.create :user }

    before { get :show, id: user }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
