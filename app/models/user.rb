class User < ActiveRecord::Base
  paginates_per 50
  
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :certifications
  belongs_to :role
  
  
  @@no_image =  "https://tse3.mm.bing.net/th?id=OIP.1LRUIB2OXVePxD5hQm4fqwEsEs&pid=Api&w=180&h=181"

  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
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

    @@preset_time_slots = [ 
      :monday_morning, :monday_afternoon, :monday_evening, :tuesday_morning,
      :tuesday_afternoon, :tuesday_evening, :wednesday_morning, :wednesday_afternoon,
      :wednesday_evening, :thursday_morning, :thursday_afternoon, :thursday_evening,
      :friday_morning, :friday_afternoon, :friday_evening, :saturday_morning,
      :saturday_afternoon, :saturday_evening, :sunday_morning, :sunday_afternoon, :sunday_evening
    ]

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
  
  
  has_and_belongs_to_many :design_experiences
  has_and_belongs_to_many :construction_experiences
  
  has_one :availability
  
  private :manager_relationships, :manager_relationships=
  private :volunteer_relationships, :volunteer_relationships=
                                    
  # Over riding this method specifies which fields we want to be able to search on
  def self.ransackable_attributes(auth_object = nil)
    ["education",
    "expertise",
    "description",
    "school"] + _ransackers.keys
  end

  ransacker :name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      Arel::Nodes::InfixOperation.new('||',
        parent.table[:first_name], Arel::Nodes.build_quoted(' ')),
      parent.table[:last_name])
  end
  
  def update_availability(availability_params)
    symbol_int_availability = Hash[availability_params.map{|x, y| [x.to_sym , y == "1" || y == true]}]
    if self.availability
      self.availability.update(symbol_int_availability)
    else
      self.availability = Availability.create(symbol_int_availability)
    end
    self.availability.save!
  end
  
  def preset_time_slots
    @@preset_time_slots
  end
  
  def self.preset_time_slots
    @@preset_time_slots
  end
  
  def role?(role)
    roles.include? role.to_s
  end
  
  def self.no_image
    return @@no_image
  end
  
  def rating_name project
    rating = project.user_rating_hash[self.id]
    total_feature_count = project.total_feature_count
    percent = ((rating.to_f / total_feature_count.to_f) * 0.1 + 0.9).round(2) * 100
    return name + " (" + percent.to_s + "%)"
  end
  
  
  def compute_cross_product features
    feature_cross_product = 0
    features.each do |column, feature_id_list|
      feature_cross_product += self.send(column).where(id: feature_id_list).length
    end

    feature_cross_product
  end

end
