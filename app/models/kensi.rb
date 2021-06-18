class Kensi < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  def self.search(search)
    if search != ""
      Kensi.where('text LIKE(?)', "%#{search}%")
    else
      Kensi.all
    end
  end
  
  validates :image, presence: true 
  validates :title, presence: true  
  validates :text,  presence: true 
end
