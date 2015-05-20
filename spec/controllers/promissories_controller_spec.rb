require 'rails_helper'

describe PromissoriesController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:proposal) { FactoryGirl.create :proposal }
  let(:promissory) { FactoryGirl.create :promissory }

  it "is a valid factory" do
    factory = FactoryGirl.build(:promissory)
    if factory.respond_to?(:valid?)
      expect(factory).to be_valid
    end
  end

  it "should require a value to donation" do
    if factory = FactoryGirl.build(:invalid_promissory)
      expect(factory).to be_invalid
    end
  end
end
