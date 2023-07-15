class FightsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "fights_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
