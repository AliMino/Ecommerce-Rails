class Store < ApplicationRecord
    validates :user_id, uniqueness: true
    belongs_to :user
end
