class Copon < ApplicationRecord
    enum expiration_type: { date: 1, usage: 0 }
    validates :discount, presence: true
    belongs_to :product

    def self.get_by_id(id)
        Copon.find(id)
    end

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
            get_usage.length == get_expiration
        else
            get_expiration < DateTime.now
        end
    end

    def get_usage
        UsedCopon.get_usage_for_copon(self.id)
    end

    def is_available_for(user_id)
        UsedCopon.where("copon_id = ? and user_id = ?", self.id, user_id).length == 0
    end

end
