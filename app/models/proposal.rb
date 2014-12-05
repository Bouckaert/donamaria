class Proposal < ActiveRecord::Base
  belongs_to :candidatura
  has_many :comments

  acts_as_votable
  acts_as_commentable

  scope :with_description, -> (description) { where("description like ?", "%#{description}%")}

  def self.search(description)
    where("description like ?", "%#{description}%")
  end

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
