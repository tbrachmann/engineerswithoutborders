class User < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_one :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin manager volunteer].freeze
  #has_and_belongs_to_many :projects
  
  has_many :manager_relationships
  has_many :manages, through: :manager_relationships, source: :project do
    def << (*projects)
      projects.flatten!
      projects.each do |project|
        project.managers << self.proxy_association.owner
      end
    end
  end

  has_many :volunteer_relationships #, inverse_of: :user
  has_many :projects, through: :volunteer_relationships, source: :project do
    def << (*projects)
      projects.flatten!
      projects.each do |project|
        project.volunteers << self.proxy_association.owner
      end
    end
  end
  
  def demote_manager_all
    my_projects = self.manages.to_a
    self.manages.delete_all
    self.projects << my_projects
    self.manager = false
  end

  def name
    if self.first_name.nil? && self.last_name.nil?
      return ""
    elsif !self.first_name.nil? && self.last_name.nil?
      return self.first_name
    elsif self.first_name.nil? && !self.last_name.nil?
      return self.last_name
    else
      return self.first_name + " " + self.last_name
    end
  end
  
  private :manager_relationships, :manager_relationships=
  private :volunteer_relationships, :volunteer_relationships=

  # Over riding this method specifies which fields we want to be able to search on
  def self.ransackable_attributes(auth_object = nil)
    ["first_name",
    "last_name",
    "education",
    "expertise",
    "description",
    "school",
    "certifications"].sort
  end
  
end
