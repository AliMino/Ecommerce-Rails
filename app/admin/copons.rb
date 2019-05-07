ActiveAdmin.register Copon do
    permit_params :product_id, :has_fixed_amount, :discount, :expiration_type, :associative

    # form do |f|
    #     f.inputs 'copons' do
    #         # f.label :product
    #         # f.select (:product) do
    #         #     products_array = Product.get_products_with_no_copons(copon.product).collect { |p| [p.title + " - " + p.category.name + " by " + p.brand.name, p.id] }
    #         #     if copon.product
    #         #         options_for_select(products_array, :selected => copon.product.id)
    #         #     else
    #         #         options_for_select(products_array)
    #         #     end
    #         # end
    #         f.label :has_fixed_amount
    #         f.check_box :has_fixed_amount
    #         f.input :discount
    #         f.select :Expiration type, [0,1]
    #     end
    # end

#     <%= form_for(transaction) do |f| %> 

#    <div class="field">
#     <%= f.label :transactionType %>
#     <%= f.select :transactionType, ['Income', 'Expense']%>
#    </div>
#      <!--  here comes ternary operator -->    
#    <div class="field <%= transaction.transactionType == 'Income' ? 'present' : 'hidden' %>">
#     <%= f.label :amount %>
#     <%= f.number_field :amount, options = { max: 0 }%>
#    </div>
#    <div class="field <%= transaction.transactionType != 'Income' ? 'present' : 'hidden' %>"">
#     <%= f.label :amount %>
#     <%= f.number_field :amount, options = { min: 0 }%>
#    </div>

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
