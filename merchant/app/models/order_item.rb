class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates :order_id, presence: { strict: true }
  validates :product_id, presence: { strict: true }
end
