class User < ApplicationRecord
    validates :name, presence: :true
    validates :email, format: < with: @, message: "Must have an @ symbol" >
end
