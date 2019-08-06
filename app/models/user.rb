class User < ApplicationRecord
    has_secure_password validations: true
    has_many :profiles, :foreign_key => 'user_id'
end
