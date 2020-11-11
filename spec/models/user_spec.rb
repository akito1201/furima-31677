require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end
 
    describe "ユーザー情報" do
     it "必要な情報が全て存在すれば登録できること" do
       expect(@user).to be_valid
     end

     it "nicknameがないと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
    
     it "メールアドレスがないと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
 
     it "すでに登録済みのメールアドレスでは登録できない" do
      user = FactoryBot.create(:user)
      @user.email = user.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
     end

     it "メールアドレスに@が含まれていないと登録できない" do
      @user.email = "testcom"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end

     it "パスワードの入力がないと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it "パスワードが６文字以上であれば登録できる" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa111"
      expect(@user).to be_valid     
    end

    it "パスワードが５文字以下だと登録できない" do
      @user.password = "aaa11"
      @user.password_confirmation = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it "パスワードが半角英数字混合で入力しないと登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "パスワードがと確認用のパスワードが一致しないと登録できない" do
      @user.password = "111aaa"
      @user.password_confirmation = "111bbb"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
    end


    describe "本人情報確認" do
     it "ユーザー本名は名字と名前がないと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end

     it "ユーザー本名は半角だと登録できない" do
      @user.last_name = "ﾃｽﾄ"
      @user.first_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end

     it "ユーザー本名のフリガナは半角だと登録できない" do
      @user.kana_last_name = "ﾃｽﾄ"
      @user.kana_first_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name is invalid")
     end

     it "誕生日が空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end


    end
 end
end


