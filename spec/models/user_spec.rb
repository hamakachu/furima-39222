require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it 'email, password, password confirmation, nickname, family_name, first_name, family_kana, first_kana, birthがあれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it 'emailが空' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'nicknameが空' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'family_nameが空' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_kanaが空' do
        @user.family_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end
      it 'first_kanaが空' do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'birthが空' do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it 'emailがすでに使用されている' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がない' do
        @user.email = "testmail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが数字のみ' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英字のみ' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角文字を含む' do
        @user.password = Faker::Internet.password(min_length: 6) + "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password confirmationがpasswordと異なる' do
        @user.password = "test1234"
        @user.password_confirmation = "sample5678"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下' do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'family_nameに全角かな以外が含まれる' do
        @user.family_name = Gimei.family.kanji + "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'first_nameに全角かな以外が含まれる' do
        @user.first_name = Gimei.first.kanji + "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'family_kanaが全角カナ以外が含まれる' do
        @user.family_kana = Gimei.family.katakana + "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid")
      end
      it 'first_kanaが全角カナ以外が含まれる' do
        @user.first_kana = Gimei.first.katakana + "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end
    end
  end
end