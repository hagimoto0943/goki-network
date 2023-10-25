class FightsController < ApplicationController
  before_action :set_status, only: %i[create update]

  def index
    @fights = Fight.includes(:user).order(created_at: :desc).limit(10)
  end

  def create
    @fight = current_user.fights.new
    if @fight.save
      ActionCable.server.broadcast(
        'some_channel', {
          count: @fights_progress.count
        }
      )
      redirect_back fallback_location: posts_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :index
    end
  end

  def update
    @fight = current_user.fights.find_by(status: 1)
    if @fight.toggle_status!
      ActionCable.server.broadcast(
        'some_channel', {
          count: @fights_progress.count
        }
      )
      redirect_back fallback_location: posts_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :index
    end
  end

  private

  def set_status
    @fights_progress = Fight.not_done
  end
end
