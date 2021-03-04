class Parchase < ApplicationRecord
  before_action :authenticate_user!, except: :index

  belongs_to : user
  belongs_to : item
  has_one : information
end
