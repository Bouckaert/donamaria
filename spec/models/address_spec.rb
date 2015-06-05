require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should validate_presence_of :user }
  it { should validate_presence_of :zip_code }
  it { should belong_to :user }
end
