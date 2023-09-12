class Tool < ApplicationRecord
  has_one :insect_type, dependent: :destroy
end
