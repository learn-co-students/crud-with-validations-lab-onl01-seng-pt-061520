class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :genre, presence: true
    validates :release_year, presence: true
    validates :released, acceptance: true 


end
