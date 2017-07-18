class User < ActiveRecord::Base
  has_and_belongs_to_many :skills
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin manager volunteer].freeze
  
  
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