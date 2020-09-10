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
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end     
        it "郵便番号が空だと登録できない" do
          @purchase_address.postal = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal can't be blank")
        end
        it "郵便番号に-が無いと登録できない" do
          @purchase_address.postal = "1233334"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
        end
        it "市区町が空だと登録できない" do
          @purchase_address.city = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end
        it "番地が空だと登録できない" do
          @purchase_address.house_num = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("House num can't be blank")
        end
        it "電話番号が空だと登録できない" do
          @purchase_address.phone = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
        end
        it "電話番号が11桁より大きいと登録できない" do
          @purchase_address.phone = '09098765432211'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
        end
        it "都道府県が空だと登録できない" do
          @purchase_address.genre_id = '1'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Genre Prefecture Select")
        end
      end
    end
  end

   