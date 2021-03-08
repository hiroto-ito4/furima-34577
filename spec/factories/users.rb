FactoryBot.define do
  factory :user do
    nickname               { 'イチロー' }
    email                  { Faker::Internet.free_email }
    password               { 'test51' }
    password_confirmation  { password }
    lastname               { '鈴木' }
    firstname              { '一郎' }
    last_furigana          { 'スズキ' }
    first_furigana         { 'イチロウ' }
    birthday               { '1973-10-22' }
  end
end
