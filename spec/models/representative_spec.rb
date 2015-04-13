require 'rails_helper'

describe Representative do
  it { should belong_to :user }
  it { should have_many :proposals }
end
