require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe 'ユーザー情報' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明文がないと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it '商品の状態についての情報ないと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it '配送料の負担についての情報がないと登録できない' do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping Select')
      end

      it '発送元の地域についての情報がないと登録できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Region Select')
      end

      it '発送までの日数についての情報がないと登録できない' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery Select')
      end

      it '価格についての情報がないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が¥300以下だと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '価格の範囲が¥9,999,999以上だと登録できない' do
        @item.price = '12345678'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '販売価格は全角数字だと登録できない' do
        @item.price = '９０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
