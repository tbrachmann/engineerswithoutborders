class Project < ActiveRecord::Base

  #has_many :events
  #has_many :roles
  #has_and_belongs_to_many :users
  
  has_many :manager_relationships
  has_many :managers, -> { distinct }, through: :manager_relationships, source: :user

  has_many :volunteer_relationships, inverse_of: :project
  has_many :volunteers, through: :volunteer_relationships, source: :user
                                  
  has_attached_file :image, styles: { large: "600x600>",
                                      medium: "300x300>",
                                      thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  #Overrides the rails-created "volunteers" so that we can return only unique user IDs.
  def volunteers
    join_statement = "LEFT OUTER JOIN 'volunteer_relationships' ON 'volunteer_relationships'.'user_id' = 'users'.'id' WHERE 'volunteer_relationships'.'project_id' = #{self.id}"
    User.joins(join_statement).uniq
  end

  def add_with_role(volunteer, role)
    #If user does not exist.
    if(!User.exists?(volunteer.id))
      return false
    #If user is already a volunteer on this project.
    elsif(volunteers.include?(volunteer))
      return false
    #Else add the volunteer with specified role
    else
      self.volunteer_relationships << VolunteerRelationship.new(:user_id => volunteer.id,
                                                                :project_id => self.id,
                                                                :role => role)
    end
  end

  def assign_role(volunteer, role)
    #If user is not a part of project nor a manager
    if(!volunteers.include?(volunteer) && !managers.include?(volunteer))
      return false
    #Add a new relationship with the new role
    else
      relationship = VolunteerRelationship.new(:user_id => volunteer.id,
                                             :project_id => self.id,
                                             :role => role)
      self.volunteer_relationships << relationship
    end
  end

  def role_of(volunteer)
    if(!volunteers.include?(volunteer)&& !managers.include?(volunteer))
      return false
    end
    #role = VolunteerRelationship.find(volunteer.id).role
    roles = VolunteerRelationship.where(user_id: volunteer.id).pluck(:role)
    if(managers.include?(volunteer))
      roles << "manager"
    end
    if(roles.all? &:blank?)
      return nil
    else
      return roles
    end
  end
  
  #private :manager_relationships, :manager_relationships=
  #private :volunteer_relationships, :volunteer_relationships=
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
