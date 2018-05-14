class AuthenticateAccount 
	prepend SimpleCommand 
	# takes the parameters and initializes a class instance
	def initialize(email, password) 
		@email = email 
		@password = password 
		#puts
	end 

	def call 
		#custome payload
		JsonWebToken.encode(
			user_id: user.id, 
			#"iss": "https://facware.com",
			"name": user.email,
			"last_name": user.email,
			"admin": true,
			"email": user.email
			#name: "#{user.name} #{user.last_name}",
			#profile: user.profile_picture,
			#has_photo: user.profile_picture.blank? ? false : true,
			#role: user.role.blank? ? "" : user.role.ability_name,
  			#admin: user.admin
			) if user 
	end 

	private 

	attr_accessor :email, :password 
	# uses the credentials to check if the user exists in the database
	def user
		account = Account.find_by_email(email)
		# If everything is true, the user will be returned
		return account if account && account.valid_password?(password) #account.authenticate(password) #user&.authenticate?(password) #user && user.authenticate(password) 
		# If not, the method will return nil
		errors.add :user_authentication, 'invalid credentials' 
		nil 
	end 
end