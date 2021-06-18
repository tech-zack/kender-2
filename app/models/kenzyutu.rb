class Kenzyutu < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :messages

  validates :image, presence: true 
  validates :title, presence: true  
  validates :text,  presence: true 
end
