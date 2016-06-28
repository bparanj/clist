class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  
  validates_presence_of :handle, :email, :password_digest
  validates_uniqueness_of :handle
  validates_confirmation_of :password
  
  has_secure_password
  
  def self.new_guest
    new(email: "#{Time.now}@bogus.com", 
        handle: Time.now,
        password_digest: 'bogus')
  end
  
  def move_to(user)
    tasks.update_all(user_id: user.id)
  end
  
  def guest?
    email.include?('bogus.com')
  end
end