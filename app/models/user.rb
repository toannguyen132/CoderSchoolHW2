class User < ApplicationRecord
  has_many :blocked_users
  has_secure_password
  has_many :friendships
  validates :name, presence: true
  validates :email, presence: true
  validates :password, confirmation: true

  default_scope { order(created_at: :desc) }

  scope :not_friends, -> (friends) { where.not(id: friends.select(:friend_id)) }

  def friends
    User.where(id: friendships.select(:friend_id))
  end

  def strangers_list
    User.where.not(id: id).not_friends(self.friendships)
  end

  def build_message
    Message.new({ sender_id: id })
  end

  def sent_messages
    Message.where(sender_id: id)
  end

  def messages
    Message.where(recipient_id: id).except_users(blocked_users).order(created_at: :desc)
  end

  def unread_messages
    Message.where(recipient_id: id, is_read: false)
  end

  def short_name
    name.split.map(&:first).join.upcase
  end

  def in_blocked_list(id)
    blocked_users.any? {|u| u.blocked_user_id == id}
  end

  # facebook
  def self.from_omniauth(auth)
    email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
    user = where(email: email).first_or_initialize
    # where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    #   user.provider = auth.provider
    #   user.uid = auth.uid
    #   user.name = auth.info.name
    #   user.oauth_token = auth.credentials.token
    #   user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    #   user.save!
    # end
  end

end
