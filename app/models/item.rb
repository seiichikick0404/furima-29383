class Item < ApplicationRecord
  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
  # アソシエーション
  has_many :messages
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_day
  has_one :purchase
  

  # バリデーション
  with_options presence: true do
    validates :name
    validates :category
    validates :image
    validates :text
    validates :status_id
    validates :burden_id
    validates :shipping_origin_id
    validates :shipping_day_id
    validates :price,
              inclusion: { in: 300..9999999, message: "Price Out of setting range" },
              numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end
  #一つ目の選択「--」の時は保存できないようにする
  validates :status_id, numericality: { other_than: 1, message:"Sales status Select" } 
  validates :category_id, numericality: { other_than: 1, message:"Category Select" } 
  validates :burden_id, numericality: { other_than: 1, message:"Shipping fee status Select" } 
  validates :shipping_day_id, numericality: { other_than: 1, message:"Scheduled delivery Select" } 
  validates :shipping_origin_id, numericality: { other_than: 1, message:"Prefecture Select" } 
end
