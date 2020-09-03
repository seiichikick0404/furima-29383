class Item < ApplicationRecord
  belongs_to :user

  # バリデーション
  validates :name, presence: true
  validates :category, presence: true
  validates :image, presence: true
  validates :text, presence: true
  validates :status, presence: true
  validates :burden, presence: true
  validates :shipping_origin, presence: true
  validates :shipping_day, presence: true
  validates :price, presence: true
end
