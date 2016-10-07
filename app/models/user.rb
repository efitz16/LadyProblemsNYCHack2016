class User < ApplicationRecord
	has_many :entries

	has_secure_password
end
