class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :estimate

  with_options presence: true do 
    validates :product_name
    validates :description
    validates :price, format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
      greater_than: 300, less_than: 10000000
      }
    validates :image
  end
  with_options numericality: { other_than: 1 }
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :estimate_id
  end


