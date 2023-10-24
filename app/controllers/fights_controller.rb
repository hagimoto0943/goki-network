class FightsController < ApplicationController
  def index
    @fights = Fight.includes(:user).order(created_at: :desc).limit(10)
  end

  def create
    @fights_progress = Fight.not_done
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
    @fights_progress = Fight.not_done
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
end
