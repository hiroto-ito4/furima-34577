class PurchaseInformation
  include ActiveModel::Model
  attr_accessor :postalcode, :area_id, :municipality, :address, :building_name, :phone_number, :purchase_id, :item_id, :user_id,
                :token, :price

  validates :token, presence: true
  validates :postalcode, presence: true,
                         format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Please enter 3 single-byte numbers, hyphens, and 4 single-byte numbers' }
  validates :area_id, numericality: { other_than: 1, message: 'Please select' }
  with_options presence: true do
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'Please enter only half-width numbers' }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Information.create(postalcode: postalcode, area_id: area_id, municipality: municipality, address: address,
                       building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
