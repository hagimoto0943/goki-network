class InsectType < ApplicationRecord
  belongs_to :countermeasures, dependent: :destroy
  belongs_to :tools, dependent: :destroy
  belongs_to :post, dependent: :destroy

  enum :type, { mosquito: 0, flies: 1, cockroach: 2, tick: 3, centipede: 4, clothingPest: 5 }
end
