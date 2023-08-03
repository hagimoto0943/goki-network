require 'rails_helper'

RSpec.describe Post, type: :model do
  context "入力値が有効" do
    it "投稿が成功する" do
      post = build(:post)
      expect(post).to be_valid
    end
  end
  context "タイトルが存在しない" do
    it "投稿が失敗する" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end
  end
  context "本文が存在しない" do
    it "投稿が失敗する" do
      post = build(:post, body: nil)
      post.valid?
      expect(post.errors[:body]).to include("を入力してください")
    end
  end
  context "タイトルが255文字以下の場合" do
    it "投稿が成功する" do
      post = build(:post, title: "a" * 255)
      expect(post).to be_valid
    end
  end
  context "タイトルが256文字以上の場合" do
    it "投稿が失敗する" do
      post = build(:post, title: "a" * 256)
      post.valid?
      expect(post.errors[:title]).to include("は255文字以内で入力してください")
    end
  end
  context "本文が65535文字以下の場合" do
    it "投稿が成功する" do
      post = build(:post, body: "a" * 65535)
      expect(post).to be_valid
    end
  end
  context "本文が65536文字以上の場合" do
    it "投稿が失敗する" do
      post = build(:post, body: "a" * 65536)
      post.valid?
      expect(post.errors[:body]).to include("は65535文字以内で入力してください")
    end
  end
end
