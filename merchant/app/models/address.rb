class Address < ActiveRecord::Base
  belongs_to :user 
  validates :line1, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :postal_code, presence: true, length: { is: 5 }, numericality: { only_integer: true }
end
