class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.released
            if record.release_year.blank?
                record.errors[:release_year] << "Release year must not be blank"
            elsif record.release_year > Time.now.year
                record.errors[:release_year] << "Release year must be less than or equal to the current year"
            end
        end
    end
end