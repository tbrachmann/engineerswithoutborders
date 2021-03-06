require 'rails_helper'

RSpec.describe InDemand, :type => :model do
  describe "As a manager" do
    before(:each) do
      @example_manager = FactoryGirl.create(:manager, password: "asdfghjkl")
      @example_project = FactoryGirl.create(:project)
      @example_experience = FactoryGirl.create(:construction_experience,
                                               name: "Deep Well")
      @example_experience2 = FactoryGirl.create(:construction_experience,
                                                name: "Deep Road")
      @example_experience3 = FactoryGirl.create(:design_experience,
                                                name: "Solar")
      @example_skill = FactoryGirl.create(:skill, name: "JavaScript")
      @example_skill2 = FactoryGirl.create(:skill, name: "CoffeeScript")
      @example_role = FactoryGirl.create(:role, name: "Blacksmith")
      @example_role = FactoryGirl.create(:certification, name: "Happiness")
      @example_indemand = FactoryGirl.create(:in_demand)

    end
    
    it "Testing Options" do
      option_count = Skill.all.length + Role.all.length +
                     ConstructionExperience.all.length + DesignExperience.all.length + Certification.all.length
      expect(@example_indemand.class.options.length).to eq option_count
    end
    
    it "Add in demand qualities on model level" do 
      # add skill/role/experience using InDemand.add_in_demand_quality
      # check with that entries correspond to inputs
      example_skill3 = FactoryGirl.build(:skill, name: "RSpec")
      @example_project.add_in_demand_quality(example_skill3)
      expect(@example_project.in_demand_qualities.first.name).to match "RSpec"
    end
    
    it "Check get_instance" do
      #      @example_indemand2 = FactoryGirl.create(:in_demand)
      skill_double = class_double("Skill").as_stubbed_const
      allow(skill_double).to receive(:find).and_return(instance_double("Skill",
                                                                       name: "mock"))
      expect(skill_double).to receive(:find).with(@example_indemand.table_id)
      expect(@example_indemand.get_instance.name).to match "mock"
    end
    
    it "Add in demand qualities to project" do
      @example_project.add_in_demand_quality @example_skill
      @example_project.add_in_demand_quality @example_skill2
      @example_project.add_in_demand_quality @example_experience
      @example_project.add_in_demand_quality @example_experience2
      
      expect(@example_project.in_demand_qualities.length).to eq 4
    end
    
    it "Get in demand qualities for project" do
      @example_project.add_in_demand_quality @example_skill
      @example_project.add_in_demand_quality @example_skill2
      @example_project.add_in_demand_quality @example_experience
      @example_project.add_in_demand_quality @example_experience2
      
      names = @example_project.in_demand_qualities.map do |q|
        q.name
      end
      expect(names).to contain_exactly("Deep Well", "Deep Road", "JavaScript", "CoffeeScript")
    end
    it "Same quality for multiple projects" do
      @example_project.add_in_demand_quality @example_skill
      @example_project.add_in_demand_quality @example_skill2
      @example_project.add_in_demand_quality @example_experience
      @example_project.add_in_demand_quality @example_experience2
      
      @example_project2 = FactoryGirl.create(:project)
      @example_project2.add_in_demand_quality @example_skill
      @example_project2.add_in_demand_quality @example_skill2
      @example_project2.add_in_demand_quality @example_experience
      @example_project2.add_in_demand_quality @example_experience2

      expect(@example_project.in_demand_qualities.length).to eq 4
      expect(@example_project2.in_demand_qualities.length).to eq 4
    end

    it "In demand qualities grouped" do
      @example_project.add_in_demand_quality @example_skill
      @example_project.add_in_demand_quality @example_skill2
      @example_project.add_in_demand_quality @example_experience
      @example_project.add_in_demand_quality @example_experience2

      expect(@example_project.in_demand_qualities_grouped.keys)
        .to include("Skill", "ConstructionExperience")
      expect(@example_project.in_demand_qualities_grouped["Skill"].count)
        .to eq 2
      expect(@example_project.in_demand_qualities_grouped["ConstructionExperience"].count)
        .to eq 2
      expect(@example_project.in_demand_qualities_grouped["DesignExperience"].count)
        .to eq 0
    end

    it "Get correct eligible qualities grouped" do
      @example_project.add_in_demand_quality @example_skill
      @example_project.add_in_demand_quality @example_skill2
      @example_project.add_in_demand_quality @example_experience
      @example_project.add_in_demand_quality @example_experience2
      @example_skill3 = FactoryGirl.create(:skill, name: "HTML")
      @example_experience4 = FactoryGirl.create(:construction_experience, name: "Shuttle")

      expect(@example_project.eligible_indemand_grouped["Skill"].count).to eq Skill.all.count-2
      expect(@example_project.eligible_indemand_grouped["ConstructionExperience"].count).to eq ConstructionExperience.all.count-2
    end

    it "Get options grouped" do
      expect(InDemand.options_grouped["Skill"].count).to eq Skill.all.count
      expect(InDemand.options_grouped["ConstructionExperience"].count).to eq ConstructionExperience.all.count
      expect(InDemand.options_grouped["Role"].count).to eq Role.all.count
      expect(InDemand.options_grouped["Certification"].count).to eq Certification.all.count
      expect(InDemand.options_grouped["DesignExperience"].count).to eq DesignExperience.all.count
    end
    
  end
end
