class SupportsController < ApplicationController
  def create
    fight = Fight.find(params[:fight_id])
    Support.create!(user_id: current_user.id, fight_id: params[:fight_id])
    render turbo_stream: turbo_stream.replace(
      fight,
      partial: 'fights/support_button',
      locals: { fight: fight }
    )
  end

  def destroy
    fight = Fight.find(params[:fight_id])
    Support.find_by(user_id: current_user.id, fight_id: params[:fight_id]).destroy!
    render turbo_stream: turbo_stream.replace(
      fight,
      partial: 'fights/support_button',
      locals: { fight: fight }
    )
  end
end
