class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
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
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :shipping_origin_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true,
            inclusion: { in: 300..9999999, message: "Price Out of setting range" },
            numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  #一つ目の選択「--」の時は保存できないようにする
  validates :status_id, numericality: { other_than: 1, message:"Sales status Select" } 
  validates :category_id, numericality: { other_than: 1, message:"Category Select" } 
  validates :burden_id, numericality: { other_than: 1, message:"Shipping fee status Select" } 
  validates :shipping_day_id, numericality: { other_than: 1, message:"Scheduled delivery Select" } 
  validates :shipping_origin_id, numericality: { other_than: 1, message:"Prefecture Select" } 
end
