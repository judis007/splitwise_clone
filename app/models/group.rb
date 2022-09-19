class Group < ApplicationRecord
  before_save :lowercase
  has_many :expenses, dependent: :destroy
  has_and_belongs_to_many :users
  
  has_one_attached :cover_picture, dependent: :destroy

  class << self
    def desc_order
      Group.all.order("created_at DESC")
    end

    def sql_like query
      Group.where("name LIKE (?)", "%#{query.downcase}%")
    end

    def search query
      if query.empty?
        Group.desc_order
      else
        group = Group.sql_like(query)
        if group.empty?
          Group.desc_order
        else
          Group.sql_like(query)
        end
      end
    end
  end

  def lowercase
    self.name&.downcase!
  end
end