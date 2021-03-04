class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :parchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :estimate

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
  end
  with_options numericality: { other_than: 1, message: 'Please select' } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :estimate_id
  end
  validates :price, presence: true, numericality: { only_integer: true,
                                                    greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Please enter a half-width number between 300 and 9,999,999' }
end
