class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :message     #メッセージとのアソシエーション
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 },
                       format: { with: /\A(?=.*?[a-z])[a-z\d]{6,32}+\z/, message: "半角英数字を含めて下さい" }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :fam_name, presence: true,
                       format: { with: VALID_NAME_REGEX, message: "は全角で入力して下さい" }
  validates :fir_name, presence: true,
                       format: { with: VALID_NAME_REGEX, message: "は全角で入力して下さい" }
  VALID_KANA_REGEX = /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
  validates :fam_kana_name, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カナ入力して下さい"}
  validates :fir_kana_name, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カナ入力して下さい"}
  validates :birthday, presence: true
  

  


end
