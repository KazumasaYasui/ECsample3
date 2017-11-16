class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # belongs_to :user

  # def self.sub_total
  #   sub_total = 0
  #   line_items.each do |line_item|
  #     sub_total += line_item.total_price
  #   end
  # end
end
