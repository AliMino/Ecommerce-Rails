class Category < ApplicationRecord
    validates :name, :presence => true, :uniqueness => true
    before_create :category_name
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

    private
        def category_name
            self.name = self.name.capitalize.pluralize
        end

end
