class Fight < ApplicationRecord
  belongs_to :user
  has_many :supports, dependent: :destroy

  enum :status, { done: 0, progress: 1 }

  def toggle_status!
    done! if progress?
  end

  def status_timeout
    fight_progress = Fight.all.where(status == "progress")
    fight_progress.each do |fight|
      start_time = fight.created_at
      done! if Time.now > start_time + 120*60
    end
  end

  def support?(user)
    supports.exists?(user_id: user.id)
  end
end
