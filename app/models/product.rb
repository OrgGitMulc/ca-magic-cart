class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory, optional: true
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
