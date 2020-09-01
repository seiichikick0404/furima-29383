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
      it "passwordが6文字以上で登録できる" do
        @user.password = "kick0411"
        @user.password_confirmation = "kick0411"
        expect(@user).to be_valid
      end
      it "fam_nameは漢字、ひらがな、カタカナのいずれかで登録できる" do
        @user.fam_name = "高橋"
        expect(@user).to be_valid
      end
      it "fir_nameは漢字、ひらがな、カタカナのいずれかで登録できる" do
        @user.fir_name = "祐樹"
        expect(@user).to be_valid
      end
      it "fam_kana_nameは全角カタカナで登録できる" do
        @user.fam_kana_name = "タカハシ"
        expect(@user).to be_valid
      end
      it "fir_kana_nameは全角カタカナで登録できる" do
        @user.fam_kana_name = "ユウキ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")     
       end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00aaa"
        @user.password_confirmation = "00aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "aa11ww22"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "fam_nameが空だと登録できない" do
        @user.fam_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Fam name can't be blank")
      end
      it "fam_nameが英数字だと登録できない" do
        @user.fam_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fam name Full-width characters")
      end
      it "fir_nameが空だと登録できない" do
        @user.fir_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Fir name can't be blank")
      end
      it "fir_nameは英数字だと登録できない" do
        @user.fir_name = "bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fir name Full-width characters")
      end
      it "fam_kana_nameが空だとだと登録できない" do
        @user.fam_kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Fam kana name can't be blank")
      end
      it "fam_kana_nameはカタカナでないと登録できない" do
        @user.fam_kana_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fam kana name Full-width characters")
      end
      it "fir_kana_nameが空だと登録できない" do
        @user.fir_kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Fir kana name can't be blank")
      end
      it "fir_kana_nameがカタカナでないと登録できない" do
        @user.fir_kana_name = "sss"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fir kana name Full-width characters")
      end
      it "birthdayが空の場合登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end















