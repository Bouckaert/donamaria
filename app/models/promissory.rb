class Promissory < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :user

  validates :proposal, :user, :amount, presence: true
  validates :amount, numericality: true
end
