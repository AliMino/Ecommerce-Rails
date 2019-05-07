class ExpirationDate < ApplicationRecord
    validate :timeline

    def self.get_all_dates
        ExpirationDate.all
    end

    def self.get_date_by_id(id)
        ExpirationDate.find(id).date
    end

    private
        def timeline
            if date < DateTime.now
                errors.add(:date, "must be in the future")
            end
        end

end
