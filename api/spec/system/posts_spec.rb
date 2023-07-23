require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) {create(:user)}
  let(:post) {create(:post, user: user)}

  describe "ゴキブリ対策のCRUD" do
    describe "掲示板一覧" do
      context "ログインしていない場合" do
        it "ログインページにリダイレクトされる" do
          visit posts_path
          expect(current_path).to eq(login_path), 'ログインページにリダイレクトされていません'
          expect(page).to have_content('ログインしてください'), 'フラッシュメッセージ「ログインしてください」が表示されていません'
        end
      end
      context "ログインしている場合" do
        it "ヘッダーのリンクからゴキブリ対策一覧画面に遷移できること" do
          login(user)
          click_on("ゴキブリ対策一覧")
          expect(current_path).to eq(posts_path)
        end
      end
    end
  end
end
