class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product
    enum state: { delivered: 3, confirmed: 2, pending: 1, added: 0}
end
