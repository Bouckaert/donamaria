require 'rails_helper'

describe Revenue do
  it { should respond_to :sequencial_candidato }
  it { should respond_to :receipt_title }
  it { should respond_to :donator }
  it { should respond_to :price }
  it { should respond_to :description }
  it { should belong_to :candidature }  
end
