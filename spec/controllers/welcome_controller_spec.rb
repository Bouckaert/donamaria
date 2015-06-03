require 'rails_helper'

describe WelcomeController, type: :controller do

  describe "GET 'index'" do
    let!(:statistics) { Stats.create(name: '2014 Statistics') }

    before { get :index }

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns statistics' do
      expect(assigns(:statistics)).to eq statistics
    end
  end
end
