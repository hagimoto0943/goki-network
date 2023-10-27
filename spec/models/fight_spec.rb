require 'rails_helper'

RSpec.describe Fight, type: :model do
  describe "#create" do
    it "statusはprogressのみ登録できる" do
      fight = build(:fight, status: 0)
      fight.valid?
    end
  end
end
