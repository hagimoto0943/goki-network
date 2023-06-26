class Profile < ApplicationRecord
  has_many :tools, dependent: :destroy
  belongs_to :user
end
