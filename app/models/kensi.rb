class Kensi < ApplicationRecord
  validates :image, presence: true 
  validates :title, presence: true  
  validates :text,  presence: true 
end
