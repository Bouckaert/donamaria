require 'rails_helper'

describe Proposal do
  it { should validate_presence_of :representative }
  it { should have_many(:promissories) }
  it { should have_many(:users).through(:promissories) }
  it { should have_many(:comments)}
end
