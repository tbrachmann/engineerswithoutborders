class Availability < ActiveRecord::Base
    belongs_to :user
    
    
    def user_params
    # this simply makes it easier to access params[:user_params[:param]]
        params.require(:user)
    end 
end