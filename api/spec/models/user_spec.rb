require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    it "名前が空欄だと登録できない" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスが空欄だと登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードが3文字以上であれば登録できる" do
      password = Faker::Internet.password(min_length: 3, max_length: 3)
      user = build(:user, password: password, password_confirmation: password)
      expect(user).to be_valid
    end

    it "パスワードと確認が一致していないと登録できない" do
      password = Faker::Internet.password
      user = build(:user, password: password, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
  end
end
