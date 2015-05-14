require 'rails_helper'

RSpec.describe Stats, type: :model do
  it { should respond_to :women_candidates }
  it { should respond_to :men_candidates }
  it { should respond_to :women_elected }
  it { should respond_to :women_patrimony }
  it { should respond_to :men_patrimony }
  it { should respond_to :women_revenue }
  it { should respond_to :men_revenue }
end
