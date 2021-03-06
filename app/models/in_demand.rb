class InDemand < ActiveRecord::Base
  belongs_to :project
  
  @@models = [Skill, ConstructionExperience, DesignExperience, Role, Certification]

  def self.models
    @@models
  end
  
  def self.add_in_demand_quality project_id, quality
    #First check if the quality exists
    quality_class = quality.class
    if !quality_class.exists?(quality.id)
      quality.save!
    end
    if InDemand.exists?(table_name: quality.class.name,
                        table_id: quality.id,
                        project_id: project_id)
        p "Already an In Demand skill"
    else
      InDemand.create(table_name: quality.class.name,
                      table_id: quality.id,
                      project_id: project_id)
    end
  end
  
  def self.options
    all_rows = []
    @@models.map{|x| x.all.map {|y| all_rows << y}}
    all_rows
  end

  def self.options_grouped
    groups = {}
    @@models.each do |klass|
      groups[klass.name] = []
      all_rows = klass.all
      groups[klass.name] += all_rows if all_rows.any? 
    end
    return groups
  end
  
  def get_instance
    name = self.table_name
    id = self.table_id
    # get model class from name
    quality_model = name.classify.constantize
    # return instance of quality
    quality_model.find(id)
  end
    
  
  def self.qualities_by_project_id project_id
    in_demand_rows = InDemand.where(project_id: project_id)
    in_demand_rows.map{|x| x.get_instance}.select{|y| (y.name != nil && y.name != "")}
  end
  
end
