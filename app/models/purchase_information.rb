class PurchaseInformation
  include ActiveModel::Model
  attr_accessor :postalcode, :area_id, :municipality, :address, :building_name, :phone_number, :purchase_id, :item_id, :user_id

  with_options presence: true do
    validates :postalcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality 
    validates :address
    validates :phone_number, numericality: { only_integer: true ,message: 'Please enter only half-width numbers'}
  end
  validates :area_id, numericality: { other_than: 1, message: 'Please select' }

    def save
      purchase = Purchase.create(item_id: item_id, user_id: user_id)
      Information.create(postalcode: postalcode, area_id: area_id , municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    end
end