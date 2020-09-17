require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    describe '商品購入' do
      context "商品購入ができる場合" do
        it "全ての情報があれば保存できる" do
          expect(@purchase_address).to be_valid
        end
      end
      context "ツイートが保存できない場合" do
        it "tokenが空だと登録できない" do
          @purchase_address.token = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
        end     
        it "郵便番号が空だと登録できない" do
          @purchase_address.postal = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
        end
        it "郵便番号に-が無いと登録できない" do
          @purchase_address.postal = "1233334"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("郵便番号-を含めて下さい")
        end
        it "市区町が空だと登録できない" do
          @purchase_address.city = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
        end
        it "番地が空だと登録できない" do
          @purchase_address.house_num = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
        end
        it "電話番号が空だと登録できない" do
          @purchase_address.phone = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
        end
        it "電話番号が11桁より大きいと登録できない" do
          @purchase_address.phone = '09098765432211'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
        end
        it "都道府県が空だと登録できない" do
          @purchase_address.genre_id = '1'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("都道府県を選択して下さい")
        end
      end
    end
  end

   