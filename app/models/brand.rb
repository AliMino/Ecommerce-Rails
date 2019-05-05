class Brand < ApplicationRecord
    validates :name, :presence => true, :uniqueness => true
    # has_many :products, dependent: :destroy
    has_many :products

    def self.get_by_name(brand_name)
        brand_name = brand_name.capitalize
        Brand.where(:name => brand_name).limit(1)[0]
    end

    def self.get_brands_names
        names = []
        Brand.all.each do |brand|
            names.append brand.name
        end
        names
    end

end
