class Proposal < ActiveRecord::Base
  belongs_to :representative
  has_many :comments
  has_many :promissories
  has_many :users, through: :promissories

  acts_as_votable
  acts_as_commentable

  validates :representative, presence: true

  scope :recent, -> { order(created_at: :desc).limit(10)}
  scope :pop, -> { Proposal.all.where(id: Proposal.all.map(&:id)).to_a.sort_by(&:score).reverse}

  def self.search(description)
    where("description like ?", "%#{description}%")
  end

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
