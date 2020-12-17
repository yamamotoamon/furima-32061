require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての値が正常であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "ニックネームが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("ニックネームを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("メールアドレスを入力してください")
      end
      it "重複したemailだと登録できない" do
        @user.save
        anather_user = FactoryBot.build(:user)
        anather_user.email = @user.email
        anather_user.valid?
        expect(anather_user.errors.full_messages).to include ("メールアドレスはすでに存在します")
      end
      it "emailに@がないと登録できない" do
        @user.email = "a4b8c4d8gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include ("メールアドレスは不正な値です")
      end
      it "パスワードがないと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードを入力してください")
      end
      it "パスワードが6文字以上でないと登録できない" do
        @user.password = "aaa12"
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは6文字以上で入力してください")
      end
      it "パスワードが英字のみの場合は登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは不正な値です")
      end
      it "パスワードが数字のみの場合は登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは不正な値です")
      end
      it "パスワードは確認用を含めて2回入力しないと登録できない" do
        @user.password = "abc111"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "パスワードと確認用パスワードが一致しないと登録できない" do
        @user.password = "aaa111"
        @user.password_confirmation = "bbb222"
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "名字が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("名字を入力してください")
      end
      it "名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("名前を入力してください")
      end
      it "名字は全角以外では登録できない" do
        @user.last_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("名字は不正な値です")
      end
      it "名前は全角以外では登録できない" do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("名前は不正な値です")
      end
      it "カナ名字が空だと登録できない" do
        @user.katakana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("カナ名字を入力してください")
      end
      it "カナ名前が空だと登録できない" do
        @user.katakana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("カナ名前を入力してください")
      end
      it "カナ名字は半角カタカナでは登録できない" do
        @user.katakana_last_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("カナ名字は不正な値です")
      end
      it "カナ名前は半角カタカナでは登録できない" do
        @user.katakana_first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("カナ名前は不正な値です")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("生年月日を入力してください")
      end
    end
  end 
end