class Product < ApplicationRecord
    belongs_to :brand
    belongs_to :category
    belongs_to :user    # seller
    has_many_attached :images
    has_many :orders
    has_one :copon

    validates :title, :presence => true, length: { minimum: 5 }
    validates :description, :presence => true, length: { minimum: 10 }
    validates :quantity, :presence => true
    validate :seller_existance
     
    
   
    validate :images_types

    def self.get_all_products
        Product.all
    end

    def self.get_products_count
        Product.all.length
    end

    def self.get_by_id(id)
        Product.find(id)
    end

    def self.search(criteria)
        if criteria
            where("title LIKE ? or description LIKE ?", "%#{criteria}%", "%#{criteria}%")
        else
            all
        end
    end

    def self.get_products_with_no_copons(except)
        products = []
        Product.all.each do |p|
            if p.copon && p.copon.is_expired
                p.copon = nil
            end
            if p.copon
                if except && p.id == except.id
                    products.append(p)
                end
            else
                products.append(p)
            end
        end
        products
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
