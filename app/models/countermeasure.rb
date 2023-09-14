class Countermeasure < ApplicationRecord
  belongs_to :insect_type
  belongs_to :extermination_type
  belongs_to :place
end
