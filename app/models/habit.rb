class Habit < ApplicationRecord
    include PgSearch::Model

    belongs_to :user
    belongs_to :category
    has_many :entries
    
    validates :name, presence: true
    validates :frequency, presence: true
    validates :start_date, presence: true

    pg_search_scope :search_by_name_and_category,
                    against: [:name, :category],
                    using: {
                        tsearch: { prefix: true }
                    }
end
