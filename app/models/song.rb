class Song < ApplicationRecord
      validates :title, presence: true, uniqueness: {scope: %i[release_year artist_name]}
    validates :released, inclusion: {in: [true,false]}
    validates :release_year, presence: true, numericality: {less_than: Time.now.year}, if: :released?
    validates :artist_name, presence: true
end

def released?
    released = true
end
