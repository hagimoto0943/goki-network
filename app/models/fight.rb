class Fight < ApplicationRecord
  belongs_to :user
  has_many :supports, dependent: :destroy

  enum :status, { done: 0, progress: 1 }

  scope :timeout_status, -> { where('id + 120 * 60 > ?', Time.now)}

  def toggle_status!
    done! if progress?
  end

  def support?(user)
    supports.exists?(user_id: user.id)
  end
end
