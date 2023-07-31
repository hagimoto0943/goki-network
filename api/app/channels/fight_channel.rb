class FightChannel < ApplicationCable::Channel
  def subscribed
    stream_from "fight_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
