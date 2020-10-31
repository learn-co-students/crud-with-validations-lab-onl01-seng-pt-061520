class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cannot be repeated by the same artist in the same year'
  }
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true 
  # validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: Time.now.year}

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  private

  def released?
    released
  end

end