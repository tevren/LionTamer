class User < ActiveRecord::Base
    ROLES = %w[admin viewer]

	def role_symbols
    	[role.to_sym]
  	end

  	def self.create_with_omniauth(auth)
	    create! do |user|
	      user.provider = auth["provider"]
	      user.uid = auth["uid"]
	      user.name = auth["info"]["name"]
	      user.role = 'viewer'
	    end
  	end
end