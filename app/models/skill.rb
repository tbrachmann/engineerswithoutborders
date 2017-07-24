class Skill < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :projects
<<<<<<< HEAD
=======

>>>>>>> 9d4fbe9781b7a0f28cb3c7d22e2e13c1b5864bdd
    def self.get_skills(skill_ids)
        total = []
        if skill_ids
            skill_ids.each do |x|
                if Skill.exists? x
                    total << Skill.find(x)
                end
            end
            return total
        else
            return []
        end
    end
    
    def self.ransackable_attributes(auth_object = nil)
      ['name']
    end

    validates :name, presence: true, allow_blank: false
    
end
