class InsectType < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :countermeasure, dependent: :destroy
  has_many :tools, dependent: :destroy

  enum :type, { mosquito: 0, flies: 1, cockroach: 2, tick: 3, centipede: 4, clothingPest: 5 }
end
