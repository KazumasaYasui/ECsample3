class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :product_images, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, length: {maximum: 500}

  accepts_attachments_for :product_images, attachment: :image
  # validates_presence_of :image

  def self.search(search)
    if search
      Product.where(['name LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end
end
