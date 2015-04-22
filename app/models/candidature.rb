class Candidature < ActiveRecord::Base
  belongs_to :representative
  has_many :revenues
  has_many :expenditures
  has_many :patrimonies

  def total_revenue; sum(revenues); end

  def total_expenditure; sum(expenditures); end

  def total_patrimony; sum(patrimonies); end

  private

  def sum(enumerable)
    enumerable.inject(0) { |sum, a| sum += a.price }
  end
end
