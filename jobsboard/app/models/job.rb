class Job < ActiveRecord::Base
  validates, :title, presence: true
  validates, :company, presence: true
  validates, :urls, presence:true, uniqueness :true 
end
