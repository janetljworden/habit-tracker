class Habit < ApplicationRecord
    belongs_to :user
    belongs_to :category, optional: true
    has_many :entries
    
    validates :name, presence: true
    validates :frequency, presence: true
    validates :start_date, presence: true
end
