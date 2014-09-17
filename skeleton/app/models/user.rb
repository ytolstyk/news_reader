class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token
  
  attr_reader :password
  
  def self.find_by_credentials(username, password)
    
  end
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def password=(password)
    @password = password
    self.password
  end
  
  private
  
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
  
  
end
