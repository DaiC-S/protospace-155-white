class Prototype < ApplicationRecord
  belongs_to :user
  
  validates :prototype_name, presence: true
  validates :catchphrase, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
