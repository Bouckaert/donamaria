require 'spec_helper'

describe Patrimony do
  it { should respond_to :sequencial_candidato }
  it { should respond_to :description }
  it { should respond_to :price }
  it { should belong_to :candidature }
end
