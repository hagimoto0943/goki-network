class Post < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader
  belongs_to :user
  has_many :likes, dependent: :destroy

  enum :post_types, { destruction: 0, prevention: 1 }
  enum :insect_types, { all_insect: 0, mosquito: 1, flies: 2, cockroach: 3, tick: 4, centipede: 5, clothingPest: 6 }
  enum :places, { all_place: 0, window: 1, entrance: 2, kitchen: 3, toilet: 4, garden: 5, balcony: 6, bath: 7, closet: 8 }

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
