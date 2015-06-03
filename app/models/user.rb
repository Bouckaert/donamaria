class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :comments
  has_many :promissories
  has_many :proposals, through: :promissories
  has_one  :address

  acts_as_voter

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def total_donated
    Promissory.where(user_id: self.id).sum(:amount)
  end

  def recipient
    py=Promissory.where(user_id: self.id).map(&:proposal_id).uniq
    pl=Proposal.where(id: py).map(&:representative_id).uniq
  end

  def donated(representative)
    p = Proposal.where(representative_id: representative.id).map(&:id).uniq
    Promissory.where(user_id: self.id).where(proposal_id: p).sum(:amount).to_i
  end

end
