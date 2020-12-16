require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user1 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user1.id)
      @user2 = FactoryBot.create(:user)
      @buy_address = FactoryBot.build(:buy_address, user_id: @user2.id, item_id: @item.id)
    end
    it 'すべての値が正しく入力されていれば保存出来る' do
      expect(@buy_address).to be_valid
    end
    it '郵便番号が空だと保存が出来ない' do
      @buy_address.postal_code = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンが入っていないと保存が出来ない' do
      @buy_address.postal_code = '1234567'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県が空だと保存が出来ない' do
      @buy_address.shipping_area_id = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Shipping area can't be blank")
    end
    it '都道府県を選択していないと保存が出来ない' do
      @buy_address.shipping_area_id = '1'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it '市区町村が空だと保存が出来ない' do
      @buy_address.municipality = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空だと保存が出来ない' do
      @buy_address.address = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Address can't be blank")
    end
    it '建物は空でも保存が出来る' do
      @buy_address.building = nil
      expect(@buy_address).to be_valid
    end
    it '電話番号が空だと保存が出来ない' do
      @buy_address.phone_number = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が11桁以下でないと保存が出来ない' do
      @buy_address.phone_number = '090123456789'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'tokenが空では登録が出来ない' do
      @buy_address.token = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Token can't be blank")
    end


  end
end
