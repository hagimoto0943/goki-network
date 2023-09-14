class ExterminationType < ApplicationRecord
  has_many :countermeasure, dependent: :destroy
  has_many :tools, dependent: :destroy

  enum :kind, { destruction: 0, prevention: 1 }
end
