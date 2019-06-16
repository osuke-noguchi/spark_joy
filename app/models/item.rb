class Item < ApplicationRecord
  attachment :image

  belongs_to :category

  validates :image, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :memo, length: { maximum: 20 }
  def self.search(search)
      if search
        Item.where(['brand LIKE ?', "%#{search}%"])
      else
        Item.all
      end
  end


end
