class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "should be a mixture of half-width numbers and English"}
  validates :nickname, presence: true
  validates :lastname, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/, message: "Fill in full-width hiragana, katakana, and kanji"}
  validates :firstname, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/, message: "Fill in full-width hiragana, katakana, and kanji"}
  validates :last_furigana, presence: true, format: { with:/\p{katakana}/, message: "Fill in full-width katakana"}
  validates :first_furigana, presence: true, format: { with:/\p{katakana}/, message: "Fill in full-width katakana"}
  validates :birthday, presence: true
end
