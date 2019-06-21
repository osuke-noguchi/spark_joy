class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def self.search(search)
      if search
        User.where(['name LIKE ?', "%#{search}%"])
      else
        USer.all
      end
  end

end
