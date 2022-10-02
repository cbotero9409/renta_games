class Order < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :days, presence: true
  validates :days, numericality: { only_integer: true }
end
