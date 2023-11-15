class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :fights, dependent: :destroy
  has_many :supports, dependent: :destroy
  has_many :support_fghts, through: :supports, source: :fight
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  accepts_nested_attributes_for :profile, allow_destroy: true

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def like(post)
    like_posts << post
  end

  def unlike(post)
    like_posts.destroy(post)
  end

  def like?(post)
    like_posts.include?(post)
  end

  def support(fight)
    support_fghts << fight
  end

  def unsupport(fight)
    support_fghts.destroy(fight)
  end

  def support?(fight)
    support_fghts.include?(fight)
  end

  def self.guest_create
    random_value = SecureRandom.hex.to_s
    User.create!(
      name: 'ゲスト',
      email: "test_#{random_value}@example.com",
      password: random_value,
      password_confirmation: random_value
    )
  end
end
