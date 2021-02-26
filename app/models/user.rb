class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                      message: 'should be a mixture of half-width numbers and English' }
  with_options presence: true do 
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Fill in full-width hiragana, katakana, and kanji' } do
      validates :lastname
      validates :firstname
    end
    with_options format: { with: /\p{katakana}/, message: 'Fill in full-width katakana' } do
      validates :last_furigana
      validates :first_furigana
    end
    validates :birthday

  end

  has_many :items

end
