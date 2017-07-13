class Project < ActiveRecord::Base
  has_many :events
  #has_many :roles
  #has_and_belongs_to_many :users
  
  has_many :manager_relationships
  has_many :managers, through: :manager_relationships, source: :user

  has_many :volunteer_relationships
  has_many :volunteers, through: :volunteer_relationships, source: :user
                                  
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def add_with_role(volunteer, role)
    if(User.find(volunteer.id).blank?)
      return false
    end
    self.volunteer_relationships << VolunteerRelationship.new(:user_id => volunteer.id,
                                                              :project_id => self.id,
                                                              :role => role)
  end

  def assign_role(volunteer, role)
    begin
      relationship = VolunteerRelationship.find(volunteer.id)
    rescue ActiveRecord::RecordNotFound => e
      if(!self.managers.include?(volunteer))
        return false
      else
        relationship = VolunteerRelationship.new(:user_id => volunteer.id,
                                                 :project_id => self.id,
                                                 :role => role)
        self.volunteer_relationships << relationship
        return true
      end
    end
    if(!relationship.role.blank?)
      relationship.role << (", " + role)
      #relationship.role << role
    else
      relationship.role = role
    end
    relationship.save!
    return true
  end

  def role_of(volunteer)
    begin
      User.find(volunteer.id)
    rescue ActiveRecord::RecordNotFound => e
      return false
    end
    role = VolunteerRelationship.find(volunteer.id).role
    if(!role.blank? && self.managers.include?(volunteer))
      return role + " / manager"
    elsif(role.blank? && self.managers.include?(volunteer))
      return "manager"
    elsif(!role.blank?)
      return role
    else
      return "No role"
    end
  end
  
  #private :manager_relationships, :manager_relationships=
  #private :volunteer_relationships, :volunteer_relationships=
end
