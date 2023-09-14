class ProductVersion < ApplicationRecord
  validates :name, presence: true

  belongs_to :product_line, optional: true
end
