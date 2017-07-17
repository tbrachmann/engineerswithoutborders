class User < ActiveRecord::Base
  has_and_belongs_to_many :skills
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin manager volunteer].freeze
  #has_and_belongs_to_many :projects
  
  has_many :manager_relationships
  has_many :manages, through: :manager_relationships, source: :project

  has_many :volunteer_relationships, inverse_of: :user
  has_many :projects, through: :volunteer_relationships, source: :project
  
  
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
