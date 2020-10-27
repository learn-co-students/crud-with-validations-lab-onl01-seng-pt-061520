class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year }

  validates :release_year, presence: true, if: :is_released?
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, allow_nil: true #need allow_nil if it's blank 

  def is_released?
    !!released
  end
end
