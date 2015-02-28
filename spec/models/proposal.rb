require 'spec_helper'

describe Proposal do
  it { should validate_presence_of :representative }
end
