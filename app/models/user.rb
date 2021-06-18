class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true

  has_many :kensis
  has_many :kenzyutus
  has_many :kendogus
  has_many :comments
  has_many :messages
  has_many :speaks
end
