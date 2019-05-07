class ProductsSearchesController < ApplicationController
    def new
        @search = ProductsSearch.new
        @brands = Brand.get_brands_names
        @categories = Category.get_categories_names
        @sellers = User.get_sellers_names
    end

    def create
        @search = ProductsSearch.create(search_params)
        @search.user_id = current_user.id
        @search.save
        redirect_to @search
    end

    def show
        @search = ProductsSearch.find(params[:id])
    end



    private

        def search_params
            params.require(:products_search).permit(:min_price, :max_price, :category, :brand, :seller)
        end

end
