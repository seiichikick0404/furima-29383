class Message < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :item
  # バリデーション
  validates :comments, presence: true
end
