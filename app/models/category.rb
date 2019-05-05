class Category < ApplicationRecord
    validates :name, :presence => true, :uniqueness => true
    has_many :products, dependent: :destroy

    def self.get_by_name(category_name)
        category_name = category_name.capitalize.pluralize
        Category.where(:name => category_name).limit(1)[0]
    end

    def self.get_categories_names
        names = []
        Category.all.each do |category|
            names.append category.name
        end
        names
    end

end
