require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,fam_name,fir_name,fam_kana_name,fir_kana_name,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailに@が無いと登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")     
       end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00aaa"
        @user.password_confirmation = "00aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "aa11ww22"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "fam_nameが空だと登録できない" do
        @user.fam_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it "fam_nameが英数字だと登録できない" do
        @user.fam_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角で入力して下さい")
      end
      it "fir_nameが空だと登録できない" do
        @user.fir_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "fir_nameは英数字だと登録できない" do
        @user.fir_name = "bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力して下さい")
      end
      it "fam_kana_nameが空だとだと登録できない" do
        @user.fam_kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
      it "fam_kana_nameはカタカナでないと登録できない" do
        @user.fam_kana_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナは全角カナ入力して下さい")
      end
      it "fir_kana_nameが空だと登録できない" do
        @user.fir_kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it "fir_kana_nameがカタカナでないと登録できない" do
        @user.fir_kana_name = "sss"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナは全角カナ入力して下さい")
      end
      it "birthdayが空の場合登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end