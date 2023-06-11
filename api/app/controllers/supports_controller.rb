class SupportsController < ApplicationController
  def create
    @support = Support.new(user_id: current_user.id, fight_id: params[:fight_id])
    @support.save
    redirect_to fights_path
  end

  def destroy
    @support = Support.find_by(user_id: current_user.id, fight_id: params[:fight_id])
    @support.destroy
    redirect_to fights_path
  end
end
