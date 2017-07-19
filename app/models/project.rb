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
  
  has_attached_file :image, styles: { large: "600x600>",
                                      medium: "300x300>",
                                      thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  private :manager_relationships, :manager_relationships=
  private :volunteer_relationships, :volunteer_relationships=
end
