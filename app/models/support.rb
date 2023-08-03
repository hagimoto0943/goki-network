class Support < ApplicationRecord
  belongs_to :user
  belongs_to :fight
  validates :user_id, uniqueness: { scope: :fight_id }
end
