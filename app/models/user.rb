class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:operator) if self.roles.blank?
  end
  has_many :notifications, as: :recipient
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :online, ->{ where("last_seen_at > ?", 15.minutes.ago) }

  def self.online
    ids = ActionCable.server.pubsub.redis_connection_for_subscriptions.smembers "online"
    where(id: ids)
  end
end
