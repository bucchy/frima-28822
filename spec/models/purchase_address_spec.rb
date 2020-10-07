require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品出品機能' do
    it '正常に入力すれば登録できること' do
      expect(@purchase_address).to be_valid
    end

    it '郵便番号が空では出品できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '郵便番号に-が含まれていないと購入できないこと' do
      @purchase_address.postal_code = '12345678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '都道府県が空では出品できないこと' do
      @purchase_address.prefecture_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県について--である0の場合でも購入できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空では出品できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では出品できないこと' do
      @purchase_address.street_address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
    end

    it '電話番号が空では出品できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号に-が含まれていると購入できないこと' do
      @purchase_address.phone_number = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Ixclude hyphen(-)')
    end

    it '電話番号が12桁以上だと購入できないこと' do
      @purchase_address.phone_number = '090123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. within 11 digits')
    end
  end
end
