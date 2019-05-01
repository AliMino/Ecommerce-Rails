class Product < ApplicationRecord
    belongs_to :brand
    belongs_to :category
    belongs_to :user    # seller

    validates :title, :presence => true, length: { minimum: 5 }
    validates :description, :presence => true, length: { minimum: 10 }
    validates :quantity, :presence => true
    validate :seller_existance

    def self.get_all_products
        Product.all
    end

    private
        def seller_existance
            if user.role != 'seller'
                errors.add(:product, 'can be added only by sellers')
            end 
        end
end
