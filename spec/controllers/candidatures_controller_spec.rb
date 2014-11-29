require 'spec_helper'

describe CandidaturesController, type: :controller do
  describe 'get index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end
  
  describe 'post import' do
    it 'redirects to candidatures_path' do
      allow(Candidature).to receive(:import)
      post :import
      expect(response).to redirect_to(candidatures_path)
    end
  end
end
