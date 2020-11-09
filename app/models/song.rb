class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.now.year}, if: Proc.new {|a| a.released?}
    # validate :song_check
    validates :title, uniqueness: true, if: :song_check

    # def song_check
    #     if Song.find_by(artist_name: self.artist_name, release_year: self.release_year)
    #         errors.add(:artist_name, "cannot release multiple songs in the same year")
    #     end
    # end

    def song_check
        !!Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
    end
end