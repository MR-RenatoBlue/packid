class OnlineChannel < ApplicationCable::Channel
  def subscribed
    ActionCable.server.pubsub.redis_connection_for_subscriptions.sadd "online", current_user.id

    stream_from "online:users"

    html = ApplicationController.render(partial: "users/online", locals: { user: current_user })
    OnlineChannel.broadcast_to "users", { id: current_user.id, status: "online", html: html }
  end

  def unsubscribed
    ActionCable.server.pubsub.redis_connection_for_subscriptions.srem "online", current_user.id

    OnlineChannel.broadcast_to "users", { id: current_user.id, status: "offline"}
  end
end
