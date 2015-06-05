require 'rails_helper'

describe User do
  it { should have_many(:promissories) }
  it { should have_many(:proposals).through(:promissories) }
  it { should accept_nested_attributes_for(:address) }
end
