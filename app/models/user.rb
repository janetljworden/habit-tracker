class User < ApplicationRecord
    has_secure_password

    validates :name, presence: :true
    validates :email, format: { with: /@/, message: "Must have an @ symbol" }, uniqueness: true
end
