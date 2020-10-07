require 'rails_helper'

# before do
#   @product = build(:product)
# end

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = build(:item)
  end

  describe 'ユーザー新規登録' do
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailには＠を含む必要がある" do
      @user.email = "aaaaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードは半角英数字混合の必要がある" do
      @user.password = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

     it "family_nameがない場合は登録できないこと" do
     @user.family_name = nil
     @user.valid?
     expect(@user.errors.full_messages).to include("Family name can't be blank")
     end

     it "family_nameが全角以外では登録できないこと" do
      @user.family_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角（漢字・ひらがな・カタカナ）文字を使用してください")
      end
 
     it "family_name_kanaがない場合は登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana 全角（カタカナ）文字を使用してください")
     end

     it "first_nameが全角以外では登録できないこと" do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）文字を使用してください")
     end

    it "first_name_kanaがない場合は登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana 全角（カタカナ）文字を使用してください")
    end

    it "birth_dayがない場合は登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
 end
  pending "add some examples to (or delete) #{__FILE__}"
end