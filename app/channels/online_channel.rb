class OnlineChannel < ApplicationCable::Channel
  def subscribed
    ActionCable.server.pubsub.redis_connection_for_subscriptions.sadd "online", current_user.id
  end

  def unsubscribed
    ActionCable.server.pubsub.redis_connection_for_subscriptions.srem "online", current_user.id
  end
end
