require 'rails_helper'

RSpec.describe Salon, type: :model do
  before do
    @salon = FactoryBot.build(:salon)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全てが存在すれば登録できる" do
        expect(@salon).to be_valid
      end

      it "building_nameは空でも保存できる" do
        @salon.building_name = ''
        expect(@salon).to be_valid
      end

      it "imageは空でも保存できる" do
        @salon.image = nil
        expect(@salon).to be_valid
      end

    end

    context '新規登録できない場合' do
      it "store_nameが空では登録できない" do
        @salon.store_name = ''
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Store name can't be blank")
      end

      it "store_nameが空では登録できない" do
        @salon.store_name = ''
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Store name can't be blank")
      end

      it "prefecture_idがないと登録できない" do
        @salon.prefecture_id = ''
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "prefecture_idが1は登録できない" do
        @salon.prefecture_id = '1'
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "prefecture_idが1は登録できない" do
        @salon.prefecture_id = '1'
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityがないと登録できない" do
        @salon.city = ''
        @salon.valid?
        expect(@salon.errors.full_messages).to include("City can't be blank")
      end

      it "street_numberがないと登録できない" do
        @salon.street_number = ''
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Street number can't be blank")
      end

      it "stationがないと登録できない" do
        @salon.station = ''
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Station can't be blank")
      end

      it "establishedがないと登録できない" do
        @salon.established = ''
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Established can't be blank")
      end

      it "establishedは数字以外だと登録できない" do
        @salon.established = 'A'
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Established is invalid")
      end

      it "establishedは今年以上の数字だと入力できない" do
        @salon.established = '2030'
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Established は今年以前の西暦を入力してください")
      end

      it "officesがないと登録できない" do
        @salon.offices = ''
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Offices can't be blank")
      end

      it "officesは数字以外だと登録できない" do
        @salon.offices = 'A'
        @salon.valid?
        expect(@salon.errors.full_messages).to include("Offices は１以上の数字を入力してください")
      end
    end

  end
end

