class Habit < ApplicationRecord
    belongs_to :user
    has_many :entries
    
    validates :name, presence: true
    validates :frequency, presence: true
    validates :start_date, presence: true
    validate :start_date_cannot_be_past_date

    def start_date_cannot_be_past_date
        if !self.persisted? && start_date < Date.today
            errors.add(:start_date, "Sorry! Your start date cannot be a past date")
        end
    end

end
