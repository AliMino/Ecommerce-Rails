class Order < ApplicationRecord
    enum state: { delivered: 2, confirmed: 1, pending: 0 }
end
