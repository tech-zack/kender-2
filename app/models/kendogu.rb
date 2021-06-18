class Kendogu < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :speaks

  def self.search(search)
    if search != ""
      Kendogu.where('text LIKE(?)', "%#{search}%")
    else
      Kendogu.all
    end
  end

  validates :image, presence: true 
  validates :title, presence: true  
  validates :text,  presence: true 
end
