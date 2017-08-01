class Product < ApplicationRecord

  enum product_category: [:vegetables, :fruits, :preserves, :other]

  has_many :categories

  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  searchkick word_start: [:name]

  def search_data
    {
      name: name,
    }
  end

end
