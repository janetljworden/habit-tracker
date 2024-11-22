class Category < ApplicationRecord
    has_many :habits
    
    validates :title, presence: true
end
