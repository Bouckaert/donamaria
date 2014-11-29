require 'spec_helper'

describe Candidate do
  it { should respond_to :name }
  it { should respond_to :occupation }
  it { should respond_to :gender }
  it { should respond_to :voter_registration }
  it { should have_many :candidatures }
  xit { should belong_to :user }
end
