class FightsController < ApplicationController
  def index
    @fights = Fight.all
  end

  def create
    @fight = current_user.fights.new
    @fights = Fight.where(status: 1)
    if @fight.save
      redirect_to fights_path
    else
      render :index
    end
  end

  def update
    current_user.fights.find_by(status: 1).toggle_status!
  end
end
