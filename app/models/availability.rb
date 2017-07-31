class Availability < ActiveRecord::Base
    belongs_to :user
    
    
    def user_params
    # this simply makes it easier to access params[:user_params[:param]]
        params.require(:user)
    end 
    
    def symbol_to_readable sym
        lst = sym.to_s.split("_")
        return_str = []
        lst.each do |li|
            if li.length > 0
                return_str << li.capitalize
            end
        end
        return_str.join(" ")
    end
    
    
    def _to_s_helper
        # returns human readable list of availabilities
        avail = []
        self.attributes.each do |x, y|
            if y && !!y == y
                avail << x
            end
        end
        avail.map{|k| (symbol_to_readable(k))}
    end
    
    def to_s
        # returns human readable string of availabilities
        _to_s_helper.join(", ")
        # avail = []
        # self.attributes.each do |x, y|
        #     if y && !!y == y
        #         avail << x
        #     end
        # end
        # avail.map{|k| (symbol_to_readable(k))}.join(", ")
    end
    
end