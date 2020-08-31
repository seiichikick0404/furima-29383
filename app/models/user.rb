class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 }
  validates :password, format: { with: /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/, message: "Password Include both letters and numbers" }
  validates :fam_name, presence: true
  validates :fam_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :fir_name, presence: true
  validates :fam_kana_name, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "Full-width characters"}
  validates :fir_kana_name, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "Full-width characters"}
  validates :birthday, presence: true
  

  


end
