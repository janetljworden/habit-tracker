class Category < ApplicationRecord
    belongs_to :user
    has_many :habits
    
    validates :title, presence: true
end
