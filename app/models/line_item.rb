class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true

  # def self.unit_price
  #   product.price
  # end

  # def self.total_price
  #   unit_price * quantity
  # end
end
