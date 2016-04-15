class Volunteer < ActiveRecord::Base
    #validates :first_name, carmen => true
    
    def self.all_states
        %w(CA AK AL AZ AR CO CT DE FL GA HI ID IL IN IA KS KY
        LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK
        OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
    end
    
    def self.status_volunteer
        %w(Student Working Unemployed Retired)
    end
    
    def self.education_volunteer
        %w(Bachelors Masters PhD)
    end
    
    def self.time_invest_volunteer
        %w(Once Twice Thrice)
    end
    
    def self.all_status
        @status_checked=[]
        @all_status = ["Student", "Working", "Unemployed", "Retired"]
    end
    
    def self.all_ratings
        @all_ratings = ['G','PG','PG-13','R', 'NC-17']
        # @ratings_checked = params[:ratings_checked]
        @checked=@all_ratings
    end

end
