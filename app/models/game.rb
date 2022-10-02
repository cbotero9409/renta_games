class Game < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :orders

  validates :name, presence: true
end
