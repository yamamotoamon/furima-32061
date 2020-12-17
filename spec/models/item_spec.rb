require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "全ての値が正常であれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "画像がないと出品ができない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it "商品名が空だと出品ができない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it "商品説明が空だと出品ができない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it "カテゴリーの情報を選択していないと出品ができない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end

      it "カテゴリーの情報が空だと出品ができない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it "商品状態の情報を選択していないと出品ができない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      
      it "商品状態の情報が空だと出品ができない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      
      it "配送料負担の情報を選択していないと出品ができない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end

      it "配送料負担の情報が空だと出品ができない" do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it "発送元地域の情報を選択していないと出品ができない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域は1以外の値にしてください")
      end

      it "発送元地域の情報が空だと出品ができない" do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
      end

      it "発送日数の情報を選択していないと出品ができない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end

      it "発送日数の情報が空だと出品ができない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it "販売価格が空だと出品ができない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it "価格の範囲が¥300以上でないと出品ができない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end

      it "価格の範囲が¥9,999,999以下でないと出品ができない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end

      it "販売価格は半角数字で入力しないと出品ができない" do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end

    end
  end
end