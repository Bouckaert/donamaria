require 'rails_helper'

describe 'consume:candidates' do
  include_context 'rake'

  xit 'prints' do
    subject.invoke
    expect(true).to be
  end
end
