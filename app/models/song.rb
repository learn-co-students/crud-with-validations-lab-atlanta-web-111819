class Song < ApplicationRecord
    validates :title, presence: true
    validate :title_repeat
    validates :artist_name, presence: true
    validate :release_date

    def release_date
        if released == false && release_year
            errors.add(:release_year, "Not released")
        elsif released == true && release_year == nil
            errors.add(:release_year, "No year entered")
        elsif release_year.to_i > Time.now.year 
            errors.add(:release_year, "Year not available")
        end
    end

    def title_repeat
        if Song.find_by(artist_name: artist_name, release_year: release_year, title: title)
            errors.add(:title, "Song may already exist")
        end
    end
end
