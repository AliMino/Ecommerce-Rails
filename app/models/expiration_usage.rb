class ExpirationUsage < ApplicationRecord
    validate :number_of_usages

    def self.get_all_usages
        ExpirationUsage.all
    end

    def self.get_usage_by_id(id)
        ExpirationUsage.find(id).usage
    end

    private
        def number_of_usages
            if usage < 1
                errors.add(:usage, "must be at least 1")
            end
        end
end
