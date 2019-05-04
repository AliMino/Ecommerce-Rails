class Product < ApplicationRecord
    belongs_to :brand
    belongs_to :category
    belongs_to :user    # seller
    has_many_attached :images
    has_many :orders

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

        def images_types
            if images.attached?
                images.each do |image|
                    unless image.content_type.in?(%('image/jpeg image/png'))
                        errors.add(:images, "have not supported format, only JPEG and PNG are supported")
                    end
                end
            else
                errors.add(:images, "are missing")
            end
        end
end
