class Tool < ApplicationRecord
  has_many :post_tools, dependent: :destroy
  belongs_to :profile
end
