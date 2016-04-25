class Volunteer < ActiveRecord::Base
    #validates :first_name, carmen => true
    
    def self.all_states
        return ["Select"] + %w(AK AL AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY
        LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK
        OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
    end
    
    def self.groups
        @groups = %w(Unassigned Fiji Haiti Honduras Nicaragua Kenya Tanzania)
    end
    
    def self.status_volunteer
        return ["Select"] + %w(Student Working Unemployed Retired)
    end
    
    def self.education_volunteer
        # %w(Primary education Bachelors Masters PhD)
        return ["Select", "Primary education", "Secondary education", "Bachelors", "Masters" ,"Doctoral"]
    end
    
    
    def self.time_invest_volunteer
        %w(Once Twice Thrice)
    end
    
    def self.all_education
        @all_education = self.education_volunteer
    end
    
    def self.all_status
        @all_status = self.status_volunteer
    end
    

    def self.all_places
        @all_places = ["Bay Area", "South America", "Europe"]
        # @places_checked = params[:places_checked]
    end
    
    def self.involvement
        @all_involvement = ["Fundraising", "Graphic Design"]
    end
    

    
end
