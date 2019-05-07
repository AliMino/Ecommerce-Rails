class ProductsSearch < ApplicationRecord
    def self.get_searches_by_user_id(user_id)
        searches = []
        all.each do |s|
            if s.user_id == user_id
                searches.append s
            end
        end
        searches
    end

    def get_products_count
        search_products.length
    end

    def search_products
        products = Product.all
        
        products = filter_by_brand(products, brand)
        products = filter_by_category(products, category)
        products = filter_by_seller(products, seller)
        products = filter_by_price(products, min_price, max_price)

        products
    end

    private
        def filter_by_price(products, min_price, max_price)
            if min_price
                products = products.where("price > ?", min_price)
            end
            if max_price
                products = products.where("price < ?", max_price)
            end
            products
        end

        def filter_by_seller(products, seller)
            if seller
                _seller = User.get_seller_by_name(seller)
                if _seller
                    seller_id = _seller.id
                    products = products.where("user_id = ?", seller_id)
                end
            end
            products
        end

        def filter_by_category(products, category)
            if category
                _category = Category.get_by_name(category)
                if _category
                    cat_id = _category.id
                    products = products.where("category_id = ?", cat_id)
                end
            end
            products
        end

        def filter_by_brand(products, brand)
            if brand
                _brand = Brand.get_by_name(brand)
                if _brand
                    brand_id = _brand.id
                    products = products.where("brand_id = ?", brand_id)
                end
            end
            products
        end
        
end
