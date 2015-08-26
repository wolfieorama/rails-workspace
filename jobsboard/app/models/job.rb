class Job < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true
  validates :company, presence: true
  validates :url, presence:true, uniqueness: true
  paginates_per 5
end
