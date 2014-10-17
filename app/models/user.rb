class User < ActiveRecord::Base	
	attr_accessible :name, :email, :password_digest, :password, :password_confirmation, :provider, :uid, :admin
	validates :email, presence: true, uniqueness: true
	has_secure_password

	after_destroy :ensure_an_admin_remains

	private

	def ensure_an_admin_remains
		if User.count.zero?
		raise "Can't delete last user"
		end
	end

	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password_digest = 0
      user.password = 1234
      user.password_confirmation = 1234
      user.save!
    	end
	end
end
