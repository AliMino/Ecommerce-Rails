class Copon < ApplicationRecord
    enum expiration_type: { date: 1, usage: 0 }
    validates :discount, presence: true
    belongs_to :product

    def get_symbol
        if has_fixed_amount
            "$"
        else
            "%"
        end
    end

    def get_expiration
        if expiration_type == "usage"
            ExpirationUsage.get_usage_by_id(associative)
        else
            ExpirationDate.get_date_by_id(associative)
        end
    end

    def is_expired
        if expiration_type == "usage"
            false
        else
            get_expiration < DateTime.now
        end
    end

end
