class Tool < ApplicationRecord
  has_many :post_tools, dependent: :destroy
  belong_to :profile
end
