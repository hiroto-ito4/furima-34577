class Item < ApplicationRecord

  belongs_to : user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :estimate
end
