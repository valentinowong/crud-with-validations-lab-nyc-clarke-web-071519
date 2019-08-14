class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Date.today.year }
    validates :artist_name, presence: true
end
