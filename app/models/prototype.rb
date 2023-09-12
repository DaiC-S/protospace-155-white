class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :prototype_name, presence: true
  validates :catchphrase, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
