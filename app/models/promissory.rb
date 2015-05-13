class Promissory < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :user
end
