require 'spec_helper'

describe RevenuesController, type: :controller do
  describe 'get index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end
  
  describe 'post import' do
    xit 'redirects to revenues_path' do
      # allow(Revenue).to receive(:import)
      post :import
      expect(response).to redirect_to(revenues_path)
    end
  end
end
