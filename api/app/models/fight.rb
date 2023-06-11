class Fight < ApplicationRecord
  belongs_to :user
  has_many :supports, dependent: :destroy

  enum :status, {done: 0, progress: 1}

  def toggle_status!
    if progress?
      done!
    end
  end

  def support?(user)
    supports.where(user_id: user.id).exists?
  end

end
