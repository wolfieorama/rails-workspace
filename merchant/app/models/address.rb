class Address < ActiveRecord::Base
  validates :line1, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :postal_code, presence: true
end
