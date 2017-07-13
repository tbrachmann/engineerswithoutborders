class User < ActiveRecord::Base
  has_and_belongs_to_many :skills
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin manager volunteer].freeze
  
  
  
  def set_skills(skill_ids)
    if skill_ids
      return skill_ids.map{|x| Skill.find(i) if Skills.include? x}
    else
      return []
    end
  end
  
end