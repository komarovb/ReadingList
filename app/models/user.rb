class User < ActiveRecord::Base
	has_secure_password
	has_many :user_books
	has_many :books, through: :user_books
	validates :first_name, :last_name, presence: true
	validates_uniqueness_of :email
	validates :password, length: { minimum: 6, maximum: 24, message: "Password should be from 6 up to 24 characters!"}

end
