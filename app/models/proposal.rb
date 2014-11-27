class Proposal < ActiveRecord::Base
  belongs_to :candidatura
  has_many :comments

  acts_as_votable
  acts_as_commentable

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
