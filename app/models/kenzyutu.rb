class Kenzyutu < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :messages

  def self.search(search)
    if search != ""
      Kenzyutu.where('text LIKE(?)', "%#{search}%")
    else
      Kenzyutu.all
    end
  end

  validates :image, presence: true 
  validates :title, presence: true  
  validates :text,  presence: true 
end
