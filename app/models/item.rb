class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_day


  # バリデーション
  validates :name, presence: true
  validates :category, presence: true
  validates :image, presence: true
  validates :text, presence: true
  validates :status, presence: true
  validates :burden, presence: true
  validates :shipping_origin, presence: true
  validates :shipping_day, presence: true
  validates :price, presence: true,
            format: { with: /\A[0-9]+\z/, message: "Password Include both letters and numbers" }
  #一つ目の選択「--」の時は保存できないようにする
  validates :status_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :burden_id, numericality: { other_than: 1 } 
  validates :shipping_origin_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 } 
end
