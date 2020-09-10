class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal, :genre_id, :item_id, :user_id, :city, :house_num, :building, :phone, :token

  # バリデーション
  with_options presence: true do
    validates :token
    validates :city
    validates :house_num
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone,  format:  {with:/\A\d{11}\z/}
    validates :genre_id, numericality: { other_than: 1, message:"Prefecture Select" } 
  end
    def save
      #  購入情報
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      # 住所の情報を保存
      Address.create(postal: postal, genre_id: genre_id, city: city, house_num: house_num, building: building, phone: phone, purchase_id: purchase.id)
    end
end

