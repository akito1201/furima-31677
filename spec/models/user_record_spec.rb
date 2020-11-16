require 'rails_helper'

RSpec.describe UserRecord, type: :model do
  before do
    @user_record = FactoryBot.build(:user_record)
  end

  describe '購入者情報' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_record).to be_valid
    end
    it 'tokenが空では保存できないこと' do
      @user_record.token = nil
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include("Token can't be blank")
    end
    it 'zipcodeが空だと保存できないこと' do
      @user_record.zipcode = nil
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include("Zipcode can't be blank")
    end
    it 'zipcodeにハイフン（-）がないと保存できないこと' do
      @user_record.zipcode = '1234567'
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include('Zipcode is invalid')
    end
    it 'zipcodeが半角英数字でないと保存できないこと' do
      @user_record.zipcode = '１２３-４５６７'
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include('Zipcode is invalid')
    end
    it 'region_idが空だと保存できないこと' do
      @user_record.region_id = nil
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include("Region can't be blank")
    end
    it 'region_idが「1」だと保存できないこと' do
      @user_record.region_id = '1'
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include('Region Select')
    end
    it 'cityが空だと保存できないこと' do
      @user_record.city = nil
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include("City can't be blank")
    end
    it 'houseが空だと保存できないこと' do
      @user_record.house = nil
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include("House can't be blank")
    end
    it '建物名は空でも保存できること' do
      @user_record.building = nil
      expect(@user_record).to be_valid
    end
    it 'telephoneが空だと保存できないこと' do
      @user_record.telephone = nil
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include("Telephone can't be blank")
    end
    it 'telephoneにハイフンがあると保存できないこと' do
      @user_record.telephone = '090-1111-2222'
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include('Telephone is invalid')
    end
    it 'telephoneは11桁以内でないと保存できないこと' do
      @user_record.telephone = '123456789123'
      @user_record.valid?
      expect(@user_record.errors.full_messages).to include('Telephone is invalid')
    end
  end
end
