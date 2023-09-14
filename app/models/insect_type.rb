class InsectType < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :countermeasure, dependent: :destroy
  has_many :tools, dependent: :destroy

  enum :type, { other:0, mosquito: 1, flies: 2, cockroach: 3, tick: 4, centipede: 5, clothingPest: 6 }
end
