class CurreciesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'currencies'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast('currencies', data)
  end
end
