class SupportsController < ApplicationController
  def create
    @fight = Fight.find(params[:fight_id])
    @support = Support.new(user_id: current_user.id, fight_id: params[:fight_id])
    @support.save
    redirect_back fallback_location: fights_path
  end

  def destroy
    @fight = Fight.find(params[:fight_id])
    @support = Support.find_by(user_id: current_user.id, fight_id: params[:fight_id])
    @support.destroy
    redirect_back fallback_location: fights_path
  end
end
