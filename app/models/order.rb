class Order < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :supplier
end
