class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true, if: :released? 
    validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: Time.now.year, allow_nil: true, message: "must not be a future release year"}
    validates :artist_name, presence: true
    validate :same_song_this_year?
    


    def released?
        self.released 
    end

    def same_song_this_year?
        if Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
            errors.add(:title, "has already been released by #{self.artist_name} in #{self.release_year}")
        end

    end

    
end
