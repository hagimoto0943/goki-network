class FightsController < ApplicationController
  def index
    @fights = Fight.where(status: 1).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def create
    @fight = current_user.fights.new
    if @fight.save
      ActionCable.server.broadcast('some_channel', {
        name: @fight.user.name,
        created_at: @fight.created_at.strftime("%Y/%m/%d %H:%M"),
        })
      redirect_to fights_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :index
    end
  end

  def update
    @fight = current_user.fights.find_by(status: 1)
    @fights = Fight.where(status: 1).includes(:user).order(created_at: :desc)
    if @fight.toggle_status!
        redirect_to fights_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :index
    end
  end
end
