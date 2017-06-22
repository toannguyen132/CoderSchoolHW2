class Message < ApplicationRecord

  def sender
    User.find_by_id(sender_id)
  end

  def set_read
    self.read_at = Time.now
    self.is_read = true
    self.save
  end

end
