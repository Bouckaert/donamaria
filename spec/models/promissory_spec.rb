require 'rails_helper'

describe Promissory do
  it { should belong_to :proposal }
  it { should belong_to :user }
  it { should validate_presence_of :proposal }
  it { should validate_presence_of :user }
end
