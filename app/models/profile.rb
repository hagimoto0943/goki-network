class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :tools
  belongs_to :user

  enum :house_structure, { wooden: 0, reinforced_concrete: 1, steel_frame: 2 }

end
