class FightsController < ApplicationController
  def index
    @fights = Fight.order(created_at: :desc)
  end

  def create
    @fight = current_user.fights.new
    if @fight.save
      redirect_to fights_path
    else
      @fights = Fight.order(created_at: :desc)
      format.html { render :index }
    end
  end

  def update
    @fight = current_user.fights.find_by(status: 1)
    @fights = Fight.order(created_at: :desc)
    if @fight.toggle_status!
      redirect_to fights_path
    end
  end
end
