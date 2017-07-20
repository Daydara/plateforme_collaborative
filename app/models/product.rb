class Product < ApplicationRecord

  enum product_category: [:Vegetables, :Fruits, :Preserves, :Other]

  has_many :categories

  belongs_to :user

end
