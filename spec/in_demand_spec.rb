require 'spec_helper'

RSpec.describe InDemand, :type => :model do
  describe "As a manager" do
    before(:each) do
      @example_manager = FactoryGirl.create(:manager, password: "asdfghjkl")
      @example_project = FactoryGirl.create(:project)
      @example_experience = FactoryGirl.create(:construction_experience,
                                               name: "Well")
      @example_experience2 = FactoryGirl.create(:construction_experience,
                                                name: "Road")
      @example_skill = FactoryGirl.create(:skill, name: "Ruby")
      @example_skill2 = FactoryGirl.create(:skill, name: "Rails")
      @example_role = FactoryGirl.create(:role, name: "Programmer")
      @example_indemand = FactoryGirl.create(:in_demand, name: "dummy")

    end
    
    it "Testing Options" do
      option_count = Skill.all.length + Role.all.length + ConstructionExperience.all.length + DesignExperience.all.lenth
      expect(@example_indemand.class.options.length).to eq option_count
    end
    
    it "Add in demand qualities on model level" do 
      # add skill/role/experience using InDemand.add_in_demand_quality
      # check with that entries correspond to inputs
    end
    
    it "Check get_instance" do
    end
    
    it "Add in demand qualities to project" do
      @example_project.add_in_demand_quality @example_skill
      @example_project.add_in_demand_quality @example_skill2
      @example_project.add_in_demand_quality @example_experience
      @example_project.add_in_demand_quality @example_experience2
      
      expect(@example_project.in_demand_qualities.length).to eq 4

    end
  end
end