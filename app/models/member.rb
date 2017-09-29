class Member < ApplicationRecord 
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
end
