require 'rails_helper'

describe Expenditure do
  it { should respond_to :sequencial_candidato}
  it { should respond_to :seller}
  it { should respond_to :price}
  it { should respond_to :description}
  it { should respond_to :candidature}
  it { should belong_to :candidature }
end
