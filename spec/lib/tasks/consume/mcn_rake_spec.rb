require 'rails_helper'
require 'json'

describe 'consume:mcn' do
  include_context 'rake'
  include_context 'MCN response bodies'

  let(:url) { "http://www.meucongressonacional.com/api/001/#{request}" }

  describe ':candidates' do
    let(:request) { 'candidatos/2014' }
    let(:response) { candidates_response_body }

    before { stub_request(:get, url).to_return(body: response) }

    it 'creates candidate' do
      expect {
        subject.invoke
      }.to change(Candidate, :count).by(1)
    end
  end

  describe ':candidatures' do
    before { FactoryGirl.create :candidate }

    it 'creates a candidature for each candidate' do
      expect {
        subject.invoke
      }.to change(Candidature, :count).by(Candidate.count)
    end
  end

  describe ':patrimonies' do
    let(:candidate) { FactoryGirl.create :candidate }
    let(:candidature) { FactoryGirl.create :candidature, representative: candidate }
    let(:request) { "candidato/2014/#{candidate.mcn_id}/bens" }
    let(:response) { patrimonies_response_body }

    before { stub_request(:get, url).to_return(body: response) }

    it 'creates patrimony for candidate candidature' do
      expect {
        subject.invoke
      }.to change(candidature.patrimonies, :count).by(1)
    end
  end

  describe ':revenues' do
    let(:candidate) { FactoryGirl.create :candidate }
    let(:candidature) { FactoryGirl.create :candidature, representative: candidate }
    let(:request) { "candidato/2014/#{candidate.mcn_id}/doacoes" }
    let(:response) { revenues_response_body }

    before { stub_request(:get, url).to_return(body: response) }

    it 'creates revenue for candidate candidature' do
      expect {
        subject.invoke
      }.to change(candidature.revenues, :count).by(1)
    end
  end

  describe ':results' do
    let(:candidate) { FactoryGirl.create :candidate, mcn_id: 1 }
    let(:candidature) { FactoryGirl.create :candidature, representative: candidate }
    let(:election_year) { candidature.election_year }
    let(:request) { "candidato/#{election_year}/#{candidate.mcn_id}/votacao" }
    let(:response) { candidature_result_response_body }
    let(:status) { [200, 'Ok'] }

    before { stub_request(:get, url).to_return(body: response, status: status) }

    it 'updates candidature' do
      subject.invoke
      expect(candidature.reload.result).to be
    end
  end
end
