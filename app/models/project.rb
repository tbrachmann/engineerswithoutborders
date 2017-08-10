class Project < ActiveRecord::Base
  @total_feature_count = 0.0000000001
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

  def in_demand_qualities_grouped
    groups = {}
    InDemand.models.each do |klass|
      groups[klass.name] = []
    end
    self.in_demand_qualities.each do |quality|
      groups[quality.class.name] << quality
    end
    return groups
  end
  
  def add_in_demand_quality quality
    InDemand.add_in_demand_quality self.id, quality
  end
  
  def availability_hash
    vs = self.volunteers
    availability_array = []
    # iterate through volunteers
    vs.each do |v|
      # check if volunteer has availability object
      if v.availability
        availability_array += v.availability._to_s_helper
      end
    end
    Hash.new(0).tap { |h| availability_array.each { |word| h[word] += 1 } }
    # what is the expected behavior, we want to display the top 3 available times. a graph?.
  end

  def eligible_volunteers
    users = User.where({"users.manager": false, "users.admin": false})
    users - self.volunteers
  end

  def eligible_managers
    managers = User.where({"users.manager": true})
    managers - self.managers
  end

  def eligible_indemand_grouped
    indemand = InDemand.options_grouped
    myIndemand = self.in_demand_qualities_grouped
    indemand.keys.each do |klass|
      indemand[klass] = indemand[klass] - myIndemand[klass]
    end
    return indemand
  end
  
  def get_project_features
    @total_feature_count = 0
    feature_names = [:skills, :certifications, :construction_experiences,
    :design_experiences]
    feature_hash = {}
    feature_names.each do |feat|
      column_features = self.send(feat)
      if column_features && column_features.length > 0
        @total_feature_count +=  column_features.length
        feature_hash[feat] = column_features.map{|quality| quality.id}.to_a
      end
    end
    feature_hash
  end
  
  
  def recommended_volunteers
    features = get_project_features
    @user_rating = {}
    User.all.each do |u|
      @user_rating[u.id] = u.compute_cross_product features
    end
    @dsc_rating_arry = @user_rating.to_a.sort_by(&:last).map{|x| x[0]}.reverse
    
  end
  
  def user_rating_hash
    @user_rating
  end
  
  def total_feature_count
    return @total_feature_count
  end
  
  def top_five_recommendations
    sorted_id_array = recommended_volunteers
    user_array = []
    count = 0
    exists_ids = self.volunteers.map{|x| x.id}.to_a
    sorted_id_array.each do |id|
      if self.volunteers.exclude? id
        user_array << User.find(id)
        if count > 3
          return user_array
        end
        count += 1
      end
    end
    user_array
  end
  
  
  private :manager_relationships, :manager_relationships=
  private :volunteer_relationships, :volunteer_relationships=
end
