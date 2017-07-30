class Project < ActiveRecord::Base
  has_many :manager_relationships
  has_many :managers, -> { distinct }, through: :manager_relationships, source: :user do
    def << (*managers)
      # If user is already a volunteer on the project, promote him to a manager
      managers.each do |manager|
        if self.proxy_association.owner.volunteers.include?(manager)
          self.proxy_association.owner.volunteers.delete(manager)
        end
        super
      end
    end
  end
  has_many :in_demand
  has_many :volunteer_relationships #, inverse_of: :project
  has_many :volunteers, -> { distinct }, through: :volunteer_relationships, source: :user do
    # If user is already a manager, do nothing
    def << (*volunteers)
      volunteers.each do |volunteer|
        if proxy_association.owner.managers.include?(volunteer)
          next
        end
        super
      end
    end
  end

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :certifications
  has_and_belongs_to_many :design_experiences
  has_and_belongs_to_many :construction_experiences
  
  
  has_attached_file :image, styles: { large: "600x600>",
                                      medium: "300x300>",
                                      thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  def in_demand_qualities
    # should return array of in demand qualities of potentially different types (skill, construction experience, role)
    InDemand.qualities_by_project_id self.id
  end
  
  def add_in_demand_quality quality
    InDemand.add_in_demand_quality self.id, quality
  end
  
  def availability_hash
    time_slots = User.preset_time_slots
    vs = self.volunteers
    availability_array = []
    # iterate through volunteers
    vs.each do |v|
      # check if volunteer has availability object
      if v.availability
        availability_array += v.availability._to_s_helper
      end
    end
    hash_count = Hash.new(0).tap { |h| availability_array.each { |word| h[word] += 1 } }
  end
  
  private :manager_relationships, :manager_relationships=
  private :volunteer_relationships, :volunteer_relationships=
end
