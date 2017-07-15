class Skill < ActiveRecord::Base
    has_and_belongs_to_many :users
    
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
end