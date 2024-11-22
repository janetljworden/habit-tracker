class User < ApplicationRecord
    has_many :habits
    has_many :categories
    has_secure_password

    validates :name, presence: :true
    validates :email, format: { with: /@/, message: "Must have an @ symbol" }, uniqueness: true

    def self.new_from_hash(user_hash)
        user = User.new user_hash
        user.password_digest = 0
        user
    end

    def has_password?
        self.password_digest.nil? || self.password_digest != '0'
    end
end
