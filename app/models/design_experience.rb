class DesignExperience < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :projects

    def self.ransackable_attributes(auth_object = nil)
      ['name']
    end
    
    validates :name, presence: true, allow_blank: false
    
end
