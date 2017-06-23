class User < ApplicationRecord
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
    Message.where(recipient_id: id).order(created_at: :desc)
  end

  def unread_messages
    Message.where(recipient_id: id, is_read: false)
  end

end
