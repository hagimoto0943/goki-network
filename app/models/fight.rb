class Fight < ApplicationRecord
  belongs_to :user
  has_many :supports, dependent: :destroy

  enum :status, { done: 0, progress: 1 }

  scope :timeout_status, -> { where('created_at + 120 * 60 > ?', (Time.now).to_datetime)}

  def toggle_status!
    done! if progress?
  end

  def support?(user)
    supports.exists?(user_id: user.id)
  end
end
