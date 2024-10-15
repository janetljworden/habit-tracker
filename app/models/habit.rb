class Habit < ApplicationRecord
    validates :name, presence: true
    validates :frequency, presence: true
    validates :start_date, presence: true

end
