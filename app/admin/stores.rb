ActiveAdmin.register Store do
    permit_params :name, :summary, :user_id

    controller do
        def create
            @store = Store.new(permitted_params[:store])
            @user=@store.user
            @user.role=1
            @user.save

            if @store.save
                flash[:notice] = "Store was successfully created!"
                render :index
            else
                render :new
            end
            
        end
    end
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
