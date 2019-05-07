class Store < ApplicationRecord
    validates :user_id, uniqueness: true, presence: true
    validates :name, presence: true, length: { minimum: 5 }
    validates :summary, presence: true, length: { minimum: 20 }
    belongs_to :user
end
