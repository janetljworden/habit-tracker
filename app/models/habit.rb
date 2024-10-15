class Habit < ApplicationRecord
    validates :name, presence: true
    validates :frequency, presence: true
    validates :start_date, presence: true
    validate :start_date_cannot_be_in_the_past

    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date.past?
            errors.add(:start_date, "Start date cannot be a past date")
        end
    end

end
