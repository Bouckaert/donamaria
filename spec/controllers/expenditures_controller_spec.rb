require 'spec_helper'

describe ExpendituresController, type: :controller do
  describe 'get index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end
  
  describe 'post import' do
    xit 'redirects to expenditures_path' do
      # allow(Expenditure).to receive(:import)
      post :import
      expect(response).to redirect_to(expenditures_path)
    end
  end
end
