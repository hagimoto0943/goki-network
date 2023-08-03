class Post < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_tools, dependent: :destroy

  enum :post_types, {destruction: 0, prevention: 1}

  scope :liked_by, -> user {
    joins(:likes).where('like.user_id = ?', user.id)
  }

  validates :title, presence: true, length: {maximum: 255}
  validates :body, presence: true, length: {maximum: 65_535}

end
