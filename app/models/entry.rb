class Entry < ApplicationRecord
    belongs_to :habit
    
    validates :date, presence: true
    validates :status, presence: true
end
