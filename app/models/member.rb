class Member < ApplicationRecord 
	has_many :ratings, dependent: :destroy
	# validates :first_name, 	presence: true,
	# 						length: { maximum: 20 }
	# validates :last_name, 	presence: true,
	# 						length: { maximum: 20 }
	validates :alter_ego, 	presence: true,
							length: { maximum: 20 }
	# validates :email, 		presence: true,
	# 						length: { minimum: 8, maximum: 30 }
	# validates :password_digest, 	presence: true,
	# 						length: {  minimum: 8, maximum: 30 }

# From https://www.railstutorial.org/book/basic_login
	# before_save { self.email = email.downcase }
	#   validates :name,  presence: true, length: { maximum: 50 }
	#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#   validates :email, presence: true, length: { maximum: 255 },
	#                     format: { with: VALID_EMAIL_REGEX },
	#                     uniqueness: { case_sensitive: false }
	#   has_secure_password
	#   validates :password, presence: true, length: { minimum: 6 }

	#   # Returns the hash digest of the given string.
	#   def User.digest(string)
	#     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	#                                                   BCrypt::Engine.cost
	#     BCrypt::Password.create(string, cost: cost)
	#   end
end
