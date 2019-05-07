class UsedCopon < ApplicationRecord
    belongs_to :user
    belongs_to :copon
    validate :user_existance
    validate :copon_existance

    def self.get_usage_for_copon(copon_id)
        UsedCopon.where("copon_id", copon_id)
    end

    private
        def user_existance
            unless user
                errors.add(:user, "must be associated with a copon usage")
            end
        end
        def copon_existance
            unless copon
                errors.add(:copon, "must be associated with a copon usage")
            end
        end
end
