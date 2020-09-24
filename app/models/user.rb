class User < ActiveRecord::Base
  has_secure_password
  
  def self.authenticate_with_credentials(user_email, password)
		self.find_by(email: user_email.strip.downcase).try(:authenticate, password)
	end
end