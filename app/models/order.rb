class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product
    enum state: { delivered: 2, confirmed: 1, pending: 0 }
end
