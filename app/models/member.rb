class Member < ApplicationRecord 
	has_many :ratings, dependent: :destroy
# Variables
	# VALID_EMAIL_REGEX = /\A[\w+\-\.{1}]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

# Validations
	validates :first_name, 	presence: true,
							length: { maximum: 20 }
	validates :last_name, 	presence: true,
							length: { maximum: 20 }
	validates :alter_ego, 	presence: true,
							length: { maximum: 20 }
	validates :email, 		presence: true,
							length: { minimum: 8, maximum: 200 }, 
							format: { with: VALID_EMAIL_REGEX },
							uniqueness: { case_sensitive: false }
	# validates :password_digest, 	presence: true,
	# 						length: {  minimum: 8, maximum: 30 }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
