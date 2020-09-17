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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "商品名が空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "商品説明が空だと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("テキストを入力してください")
      end
      it "カテゴリー情報が空だと登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力して下さい")
      end
      it "商品の状態情報が空だと登録できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を入力して下さい")
      end
      it "発送料負担についての情報が空だと登録できない" do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担方法を入力して下さい")
      end
      it "発送元の地域についての情報が空だと登録できない" do
        @item.shipping_origin_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元を入力して下さい")
      end
      it "発送までの日数が空だと登録できない" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力して下さい")
      end
      it "価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end
      it "価格が300円以下だと登録できない" do
        @item.price = "30"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は範囲内で入力して下さい")
      end
      it "価格が9999999より大きいと登録できない" do
        @item.price = "99999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は範囲内で入力して下さい")
      end
      it "価格は半角英数字でないと登録できない" do
        @item.price = "ああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は半角数字で入力して下さい")
      end
    end
  end
end
