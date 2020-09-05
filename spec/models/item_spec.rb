require 'rails_helper'
RSpec.describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/furima-intro02.png')
  end

  describe '商品投稿' do
    context '新規登録がうまくいくとき' do
      it "全ての情報が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品投稿がうまくいかないとき' do
      it "画像が一枚必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空だと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリー情報が空だと登録できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Category Select")
      end
      it "商品の状態情報が空だと登録できない" do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Sales status Select")
      end
      it "発送料負担についての情報が空だと登録できない" do
        @item.burden = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden Shipping fee status Select")
      end
      it "発送元の地域についての情報が空だと登録できない" do
        @item.shipping_origin = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin Prefecture Select")
      end
      it "価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300円以下だと登録できない" do
        @item.price = "30"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Price Out of setting range")
      end
      it "価格が9999999以上だと登録できない" do
        @item.price = "99999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Price Out of setting range")
      end
      it "価格は半角英数字でないと登録できない" do
        @item.price = "ああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Price Out of setting range")
      end
    end
  end
end
