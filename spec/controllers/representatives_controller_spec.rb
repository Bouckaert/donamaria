require 'spec_helper'

describe RepresentativesController, type: :controller do
  describe "GET 'index'" do
    before { get :index }

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns representatives' do
      expect(assigns(:representatives)).to be
    end
  end

  describe "GET 'show'" do
    let(:representative) { FactoryGirl.create :representative }

    before { get :show, id: representative }

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns representative' do
      expect(assigns(:representative)).to be
    end

    it 'assigns proposals' do
      expect(assigns(:proposals)).to be
    end
  end
end
