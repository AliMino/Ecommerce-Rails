class UsedCopon < ApplicationRecord
    belongs_to :user
    belongs_to :copon

    def self.get_usage_for_copon(copon_id)
        UsedCopon.where("copon_id", copon_id)
    end
end
