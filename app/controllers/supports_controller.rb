class SupportsController < ApplicationController
  def create
    fight = Fight.find(params[:fight_id])
    current_user.support(fight)
    render turbo_stream: turbo_stream.replace(
      fight,
      partial: 'fights/support_button',
      locals: { fight: fight }
    )
  end

  def destroy
    fight = current_user.supports.find(params[:id]).fight
    current_user.unsupport(fight)
    render turbo_stream: turbo_stream.replace(
      fight,
      partial: 'fights/support_button',
      locals: { fight: fight }
    )
  end
end
