class Group < ApplicationRecord
  has_many :expenses, dependent: :destroy
  has_and_belongs_to_many :users
  
  has_one_attached :cover_picture, dependent: :destroy

end