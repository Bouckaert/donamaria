require 'spec_helper'

describe CandidatesController, type: :controller do
  describe 'get index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end
  
  describe 'post import' do
    it 'redirects to candidates_path' do
      allow(Candidate).to receive(:import)
      post :import
      expect(response).to redirect_to(candidates_path)
    end
  end
end
