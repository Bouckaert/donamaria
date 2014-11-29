require 'spec_helper'

describe PatrimoniesController, type: :controller do
  describe 'get index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end
  
  describe 'post import' do
    xit 'redirects to patrimonies_path' do
      # allow(Patrimony).to receive(:import)
      post :import
      expect(response).to redirect_to(patrimonies_path)
    end
  end
end
