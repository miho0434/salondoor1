require 'rails_helper'

RSpec.describe Worker, type: :model do
  before do
    @worker = FactoryBot.build(:worker)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全てが存在すれば登録できる" do
        expect(@worker).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @worker.nickname = ''
        @worker.valid?
        expect(@worker.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @worker.email = ''
        @worker.valid?
        expect(@worker.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @worker.password = ''
        @worker.valid?
        expect(@worker.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下では登録できない" do
        @worker.password = '00000'
        @worker.password_confirmation = '00000'
        @worker.valid?
        expect(@worker.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが129文字以上では登録できない" do
        @worker.password = Faker::Internet.password(min_length: 129)
        @worker.password_confirmation = @worker.password
        @worker.valid?
        expect(@worker.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @worker.password = '123456'
        @worker.password_confirmation = '1234567'
        @worker.valid?
        expect(@worker.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @worker.save
        another_worker = FactoryBot.build(:worker)
        another_worker.email = @worker.email
        another_worker.valid?
        expect(another_worker.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @worker.email = 'testmail'
        @worker.valid?
        expect(@worker.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end
