class Information < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postalcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality 
    validates :address
    validates :phone_number, numericality: { only_integer: true ,message: 'Please enter only half-width numbers'}
  end
    validates :area_id, numericality: { other_than: 1, message: 'Please select' }
end
