require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    # コメントアウト中1224確認中　
    # context '新規登録がうまくいくとき' do
    #   it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
    #     expect(@user).to be_valid
    #   end
      # it "passwordが6文字以上であれば登録できる" do
      #   @user.password = "abcd123"
      #   @user.password_confirmation = "abcd123"
      #   expect(@user).to be_valid
      # end
      # it "パスワードに半角英数字混合での入力してあれば登録できる" do
      #   @user.password = "/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i"
      #   @user.password_confirmation =  "/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i"
      #   expect(@user).to be_valid
      # end
      # it "名字が全角文字で入力してあれば登録できる" do
      #   @user.last_name　= "/\A[ぁ-んァ-ヶ一-龥々]+\z/"
      #   expect(@user).to be_valid
      # end
      # it "名前が全角文字で入力してあれば登録できる" do
      #   @user.first_name　= "/\A[ぁ-んァ-ヶ一-龥々]+\z/"
      #   expect(@user).to be_valid
      # end
      # it "名字のふりがなが全角カナで入力してあれば登録できる" do 
      #   @user.furigana_last_name　= "/\A[ァ-ヶー－]+\z/"
      #   expect(@user).to be_valid
      # end
      # it "名前のふりがなが全角カナで入力してあれば登録できる" do
      #   @user.furigana_first_name = "/\A[ァ-ヶー－]+\z/"
      #   expect(@user).to be_valid
      # end
    # end
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
       it "emialに@がないと登録できない" do
         @user.email = "samplegmail.com"
         @user.valid?
         expect(@user.errors.full_messages).to include("Email is invalid")
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
      it "passwordが6文字以内だと登録できない" do 
        @user.password = 000000
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end 
      it "passwordに半角英数字混合でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password 英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password 
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名は、名字が空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end 
      it "ユーザー本名は、名前が空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力がないと登録できない" do
        @user.last_name = "roma"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力がないと登録できない" do
        @user.first_name = "roma"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
        it "ユーザー本名のフリガナは、全角（カタカナ）での入力がないと登録できない" do
          @user.furigana_last_name = "furigana"
          @user.valid?
          expect(@user.errors.full_messages).to include("Furigana last name 全角カナを使用してください")
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力がないと登録できない" do
         @user.furigana_first_name = "furigana"
         @user.valid?
         expect(@user.errors.full_messages).to include("Furigana first name 全角カナを使用してください")
      end
      it "生年月日が空では登録できない" do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end

# 必須のチェック項目　1224確認中。
# 1 ニックネームが必須であること
# 1 メールアドレスが必須であること
# 1 メールアドレスが一意性であること
# 1 メールアドレスは、@を含む必要があること
# 1 パスワードが必須であること
# 1 パスワードは、6文字以上での入力が必須であること
# 1 パスワードは、半角英数字混合での入力が必須であること
# 1 パスワードは、確認用を含めて2回入力すること
# 1 パスワードとパスワード（確認用）、値の一致が必須であること
# 1 ユーザー本名は、名字と名前がそれぞれ必須であること
# 1 ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
# 1 ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
# 1 ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
# 1 生年月日が必須であること
