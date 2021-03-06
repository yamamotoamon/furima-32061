require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user1 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user1.id)
      @user2 = FactoryBot.create(:user)
      @buy_address = FactoryBot.build(:buy_address, user_id: @user2.id, item_id: @item.id)
    end
    context '商品購入が出来るとき' do
      it "すべての値が正しく入力されていれば保存出来る" do
        expect(@buy_address).to be_valid
      end
      it '建物は空でも保存が出来る' do
        @buy_address.building = nil
        expect(@buy_address).to be_valid
      end
    end

    context '商品購入が出来ないとき' do
      it '郵便番号が空だと保存が出来ない' do
        @buy_address.postal_code = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンが入っていないと保存が出来ない' do
        @buy_address.postal_code = 1234567
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("郵便番号はハイフンを含めてください")
      end
      it '都道府県が空だと保存が出来ない' do
        @buy_address.shipping_area_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it '都道府県を選択していないと保存が出来ない' do
        @buy_address.shipping_area_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("都道府県を選んでください")
      end
      it '市区町村が空だと保存が出来ない' do
        @buy_address.municipality = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("市町村を入力してください")
      end
      it '番地が空だと保存が出来ない' do
        @buy_address.address = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("住所を入力してください")
      end
      it '電話番号が空だと保存が出来ない' do
        @buy_address.phone_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が11桁以下でないと保存が出来ない' do
        @buy_address.phone_number = 123456789012
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が数字のみでないと登録が出来ない' do
        @buy_address.phone_number = "abcd123efgh"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'tokenが空では登録が出来ない' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("トークンを入力してください")
      end
      it 'user_idが空では登録が出来ない' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では登録が出来ない' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
