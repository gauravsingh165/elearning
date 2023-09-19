class ProductLine < ApplicationRecord
  has_many :product_versions

  scope :ordered, -> { order(id: :desc) }
end
