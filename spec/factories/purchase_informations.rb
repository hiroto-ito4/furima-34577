FactoryBot.define do
  factory :purchase_information do
    token { 'tok_abcdefghijk00000000000000000' }
    postalcode      { '123-4567' }
    area_id         { 2 }
    municipality    { '例市' }
    address         { 'サンプル町1-1' }
    building_name   { '東京タワー' }
    phone_number    { '09012345678' }
    user_id         { 4 }
    item_id         { 3 }
  end
end
