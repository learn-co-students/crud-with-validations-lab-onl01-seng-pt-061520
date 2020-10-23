class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true, if: :already_released?
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: Time.now.year}
  validates :artist_name, presence: true

  private

  def released?
    self.released
  end

  def already_released?
    !!Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
  end
end