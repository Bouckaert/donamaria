class Representative < ActiveRecord::Base
  has_many :proposals, dependent: :destroy
  belongs_to :user

  scope :with_name, -> (name) { where("name like ?", "%#{name}%")}
  scope :with_gender, -> (gender) { where("gender like ?", "%#{gender}%")}
  scope :candidates, -> { where(type: 'Candidate') }
  scope :ambassadors, -> { where(type: 'Ambassador') }

  require 'csv'

  def self.search(name)
    where("name like ?", "%#{name}%")
  end

  def self.type
    %w(Candidate Ambassador)
  end

end
