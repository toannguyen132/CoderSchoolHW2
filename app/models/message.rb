class Message < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.except_users(users)
    where.not(sender_id: users.collect{|u| u.blocked_user_id })
  end

  def sender
    User.find_by_id(sender_id)
  end

  def recipient
    User.find_by_id(recipient_id)
  end

  def set_read
    self.read_at = Time.now
    self.is_read = true
    self.save
  end

end
