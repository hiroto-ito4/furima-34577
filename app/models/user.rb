class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email
  validates :password
  validates :nickname, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :last_furigana, presence: true
  validates :first_furigana, presence: true
  validates :birthday, presence: true
end
