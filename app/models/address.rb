class Address < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  def full_address
    "#{street} #{complement}, #{district} - #{city}, #{state} CEP:#{zip_code}"
  end

end
