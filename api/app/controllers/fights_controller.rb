class FightsController < ApplicationController
  def index
    @fights = Fight.order(created_at: :desc)
  end

  def create
    @fight = current_user.fights.new
    respond_to do |format|
      if @fight.save
        format.html { redirect_to fights_path }
        format.turbo_stream
      else
        @fights = Fight.order(created_at: :desc)
        format.html { render :index }
      end
    end
  end

  def update
    current_user.fights.find_by(status: 1).toggle_status!
  end
end
