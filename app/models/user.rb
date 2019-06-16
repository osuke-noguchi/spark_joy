class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   has_many :items, dependent: :destroy
   validates :name, presence: true, length: { in: 2..10 }
   validates :email, uniqueness: true
end
