class Place < ApplicationRecord
  has_many :countermeasure, dependent: :destroy
  has_many :tools, dependent: :destroy

  enum :spot, { all_place: 0, window: 1, entrance: 2, kitchen: 3, toilet: 4, garden: 5, balcony: 6, bath: 7, closet: 8 }
end
