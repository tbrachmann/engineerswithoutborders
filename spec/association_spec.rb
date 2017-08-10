require 'rails_helper'

# User associations: Project (as Volunteer through VolunteerRelationship), Roles (has_one), Skills (HABTM), Certifications (HABTM), Experience (HABTM)

RSpec.describe User, :type => :model do
  describe "As a volunteer" do
    before(:each) do
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      @example_project = FactoryGirl.create(:project)
    end
    it "Has a valid factory" do
      expect(@example_user).to be_valid
      expect(@example_project).to be_valid
    end
    it "Adding projects" do
      @example_project2 = FactoryGirl.create(:project)
      @example_user.projects << @example_project
      @example_user.projects << @example_project2
      expect(@example_user.projects.count).to eq 2
    end
    it "Removing project from user" do
      @example_user.projects << @example_project
      @example_user.projects.delete(@example_project)
      expect(@example_user.projects.count).to eq 0
    end
    it "Destroying project" do
      @example_user.projects << @example_project
      @example_project.destroy
      expect(@example_user.projects.count).to eq 0
    end
  end
  describe "As a manager" do
    before(:each) do
      @example_manager = FactoryGirl.create(:manager, password: "asdfghjkl")
      @example_project = FactoryGirl.create(:project)
    end
    it "Has a valid factory" do
      expect(@example_manager).to be_valid
      expect(@example_project).to be_valid
    end
    it "Adding managed projects" do
      @example_project2 = FactoryGirl.create(:project)
      @example_manager.manages << @example_project
      @example_manager.manages << @example_project2
      expect(@example_manager.manages.count).to eq 2
    end
    it "No duplicate projects" do
      @example_manager.manages << @example_project
      @example_manager.manages << @example_project
      expect(@example_manager.manages.count).to eq 2
    end
    it "Lose managerial status" do
      # No longer be a manager but persist as a user
      @example_project2 = FactoryGirl.create(:project)
      @example_manager.manages << @example_project
      @example_manager.manages << @example_project2
      @example_manager.manages.delete_all
      expect(@example_manager.manages.count).to eq 0
      expect(@example_project.managers.count).to eq 0
      expect(@example_project2.managers.count).to eq 0
    end
    it "Demote manager on all projects" do
      @example_project2 = FactoryGirl.create(:project)
      @example_manager.manages << [@example_project, @example_project2]
      @example_manager.demote_manager_all
      expect(@example_manager.manages.count).to eq 0
      expect(@example_manager.projects.count).to eq 2
      expect(@example_project.managers.count).to eq 0
      expect(@example_project2.managers.count).to eq 0
      # Manager loses manager privileges
      expect(@example_manager.manager).to be false
    end
    it "Adding as volunteer when already manager" do
      @example_manager.manages << @example_project
      @example_manager.projects << @example_project
      expect(@example_manager.projects.count).to eq 0
      expect(@example_manager.manages.count).to eq 1
    end
    it "Adding as manager when already volunteer" do
      @example_manager.projects << @example_project
      @example_manager.manages << @example_project
      expect(@example_manager.projects.count).to eq 0
      expect(@example_manager.manages.count).to eq 1
    end
    it "Removing project from manager" do
      @example_manager.manages << @example_project
      @example_manager.manages.delete(@example_project)
      expect(@example_manager.manages.count).to eq 0
    end
    it "Destroying project" do
      @example_manager.manages << @example_project
      @example_project.destroy
      expect(@example_manager.manages.count).to eq 0
    end
  end
  # Add role, skill, experience tests here
  describe "User roles" do
    before(:each) do
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      @example_role = FactoryGirl.create(:role, name: "Programmer")
    end
    it "Adding role column to user" do
      expect(@example_user.role).to be_nil
    end
    it "Get role name" do
      @example_user.role = @example_role
      expect(@example_user.role.name).to match "Programmer"
    end
    it "No duplicate roles" do
      expect{
        @example_role2 = FactoryGirl.create(:role, name: "Programmer")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build role off user" do
      @example_user.create_role(name: "Cook")
      expect(@example_user.role.name).to match "Cook"
    end
    it "Role stays in table if user is deleted" do
      @example_user.create_role(name: "Cook")
      @example_user.destroy
      expect(Role.all.count).to eq 2
    end
    it "Multiple user have the same role" do
      @example_user2 = FactoryGirl.create(:user, password: "asdfghjkl")
      @example_user.role = @example_role
      @example_user.save
      @example_user2.role = @example_role
      @example_user2.save
      expect(@example_role.users.count).to eq 2
    end
    it "Get role by name or return nil" do
      role = Role.get_role(@example_role.id)
      expect(role.name).to match "Programmer"
      bad_role = Role.get_role(2)
      expect(bad_role).to be_nil
    end
  end
  describe "User skills" do
    before(:each) do
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      @example_skill = FactoryGirl.create(:skill, name: "Ruby")
      @example_skill2 = FactoryGirl.create(:skill, name: "Rails")
    end
    it "Add multiple skills to user" do
      @example_user.skills << [@example_skill, @example_skill2]
      expect(@example_user.skills.count).to eq 2
    end
    it "Get skill name" do
      @example_user.skills << [@example_skill, @example_skill2]
      names = @example_user.skills.pluck("name")
      expect(names).to include "Ruby"
      expect(names).to include "Rails"
    end
    it "No duplicate skills can be added" do
      expect{
        @example_skill3 = FactoryGirl.create(:skill,
                                                     name: "Ruby")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build skill off user" do
      @example_user.skills.create(name: "C++")
      expect(@example_user.skills.first.name).to match "C++"
    end
    it "Blank skill cannot be added" do
      expect{
        @example_skill3 = FactoryGirl.create(:skill,
                                                     name: "")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Skill stays in table if user is deleted" do
      @example_user.skills.create(name: "C++")
      @example_user.destroy
      expect(Skill.all.count).to eq 3
    end
  end
  describe "User certifications" do
    before(:each) do
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      @example_certification = FactoryGirl.create(:certification, name: "Microsoft Excel")
      @example_certification2 = FactoryGirl.create(:certification, name: "Microsoft Word")
    end
    it "Add multiple certifications to user" do
      @example_user.certifications << [@example_certification, @example_certification2]
      expect(@example_user.certifications.count).to eq 2
    end
    it "Get certification name" do
      @example_user.certifications << [@example_certification, @example_certification2]
      cert_names = @example_user.certifications.pluck("name")
      expect(cert_names).to include "Microsoft Excel"
      expect(cert_names).to include "Microsoft Word"
    end
    it "No duplicate certifications can be added" do
      expect{
        @example_certification3 = FactoryGirl.create(:certification,
                                                     name: "Microsoft Excel")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build certification off user" do
      @example_user.certifications.create(name: "Microsoft Powerpoint")
      expect(@example_user.certifications.first.name).to match "Microsoft Powerpoint"
    end
    it "Blank certification cannot be added" do
      expect{
        @example_certification3 = FactoryGirl.create(:certification,
                                                     name: "")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Certification stays in table if user is deleted" do
      @example_user.certifications.create(name: "Microsoft Powerpoint")
      @example_user.destroy
      expect(Certification.all.count).to eq 3
    end
  end
  # Revisit design here - necessary for these to be separate tables?
  describe "User construction experience" do
    before(:each) do
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      @example_experience = FactoryGirl.create(:construction_experience,
                                               name: "Well")
      @example_experience2 = FactoryGirl.create(:construction_experience,
                                                name: "Road")
    end
    it "Add multiple construction experiences to user" do
      @example_user.construction_experiences << [@example_experience, @example_experience2]
      expect(@example_user.construction_experiences.count).to eq 2
    end
    it "Get construction experience name" do
      @example_user.construction_experiences << [@example_experience, @example_experience2]
      names = @example_user.construction_experiences.pluck("name")
      expect(names).to include "Well"
      expect(names).to include "Road"
    end
    it "No duplicate construction experiences can be added" do
      expect{
        @example_experience3 = FactoryGirl.create(:construction_experience,
                                                  name: "Well")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build construction experience off user" do
      @example_user.construction_experiences.create(name: "Solar")
      expect(@example_user.construction_experiences.first.name).to match "Solar"
    end
    it "Blank construction experience cannot be added" do
      expect{
        @example_experience3 = FactoryGirl.create(:construction_experience,
                                                  name: "")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "construction experience stays in table if user is deleted" do
      @example_user.construction_experiences.create(name: "Solar")
      @example_user.destroy
      expect(ConstructionExperience.all.count).to eq 3
    end
  end
  describe "User design experience" do
    before(:each) do
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      @example_experience = FactoryGirl.create(:design_experience,
                                               name: "Well")
      @example_experience2 = FactoryGirl.create(:design_experience,
                                                name: "Road")
    end
    it "Add multiple design experiences to user" do
      @example_user.design_experiences << [@example_experience, @example_experience2]
      expect(@example_user.design_experiences.count).to eq 2
    end
    it "Get design experience name" do
      @example_user.design_experiences << [@example_experience, @example_experience2]
      names = @example_user.design_experiences.pluck("name")
      expect(names).to include "Well"
      expect(names).to include "Road"
    end
    it "No duplicate design experiences can be added" do
      expect{
        @example_experience3 = FactoryGirl.create(:design_experience,
                                                  name: "Well")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build design experience off user" do
      @example_user.design_experiences.create(name: "Solar")
      expect(@example_user.design_experiences.first.name).to match "Solar"
    end
    it "Blank design experience cannot be added" do
      expect{
        @example_experience3 = FactoryGirl.create(:design_experience,
                                                  name: "")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Design experience stays in table if user is deleted" do
      @example_user.design_experiences.create(name: "Solar")
      @example_user.destroy
      expect(DesignExperience.all.count).to eq 3
    end
  end
end

# Project associations: Volunteers (Users through VolunteerRelationships), and Managers
# (Users through ManagerRelationships), Skills, Certifications, etc.

RSpec.describe Project, :type => :model do
  describe "Volunteers" do
    before(:each) do
      @example_project = FactoryGirl.create(:project)
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      @example_user2 = FactoryGirl.create(:user, password: "asdfghjkl")
    end
    it "Adding volunteers" do
      @example_project.volunteers << @example_user
      @example_project.volunteers << @example_user2
      expect(@example_project.volunteers.count).to eq 2
    end
    it "No duplicate volunteers" do
      @example_project.volunteers << @example_user
      @example_project.volunteers << @example_user2
      @example_project.volunteers << @example_user
      expect(@example_project.volunteers.count).to eq 2
    end
    it "Remove volunteers" do
      @example_project.volunteers << @example_user
      @example_project.volunteers.delete(@example_user)
      expect(@example_project.volunteers.count).to eq 0
    end
    it "Destroy volunteer" do
      @example_project.volunteers << @example_user
      @example_user.destroy
      expect(@example_project.volunteers.count).to eq 0
    end
  end
  describe "Managers" do
    before(:each) do
      @example_project = FactoryGirl.create(:project)
      @example_manager = FactoryGirl.create(:manager, password: "asdfghjkl")
      @example_manager2 = FactoryGirl.create(:manager, password: "asdfghjkl")
    end
    it "Adding managers" do
      @example_project.managers << @example_manager
      @example_project.managers << @example_manager2
      expect(@example_project.managers.count).to eq 2
    end
    it "No duplicate managers" do
      @example_project.managers << @example_manager
      @example_project.managers << @example_manager
      expect(@example_project.managers.count).to eq 1
    end
    it "Removing manager from project" do
      @example_project.managers << @example_manager
      @example_project.managers << @example_manager2
      @example_project.managers.delete(@example_manager)
      expect(@example_project.managers.count).to eq 1
    end
    it "Destroying manager" do
      @example_project.managers << @example_manager
      @example_project.managers << @example_manager2
      @example_manager.destroy
      expect(@example_project.managers.count).to eq 1
    end
  end
  describe "Project skills" do
    before(:each) do
      @example_project = FactoryGirl.create(:project)
      @example_skill = FactoryGirl.create(:skill, name: "Ruby")
      @example_skill2 = FactoryGirl.create(:skill, name: "Rails")
    end
    it "Add multiple skills to project" do
      @example_project.skills << [@example_skill, @example_skill2]
      expect(@example_project.skills.count).to eq 2
    end
    it "Get skill name" do
      @example_project.skills << [@example_skill, @example_skill2]
      names = @example_project.skills.pluck("name")
      expect(names).to include "Ruby"
      expect(names).to include "Rails"
    end
    it "No duplicate skills can be added" do
      expect{
        @example_skill3 = FactoryGirl.create(:skill,
                                                     name: "Ruby")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build skill off project" do
      @example_project.skills.create(name: "C++")
      expect(@example_project.skills.first.name).to match "C++"
    end
    it "Blank skill cannot be added" do
      expect{
        @example_skill3 = FactoryGirl.create(:skill,
                                                     name: "")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Skill stays in table if project is deleted" do
      @example_project.skills.create(name: "C++")
      @example_project.destroy
      expect(Skill.all.count).to eq 3
    end
  end
  describe "Project certifications" do
    before(:each) do
      @example_project = FactoryGirl.create(:project)
      @example_certification = FactoryGirl.create(:certification, name: "Microsoft Excel")
      @example_certification2 = FactoryGirl.create(:certification, name: "Microsoft Word")
    end
    it "Add multiple certifications to project" do
      @example_project.certifications << [@example_certification, @example_certification2]
      expect(@example_project.certifications.count).to eq 2
    end
    it "Get certification name" do
      @example_project.certifications << [@example_certification, @example_certification2]
      cert_names = @example_project.certifications.pluck("name")
      expect(cert_names).to include "Microsoft Excel"
      expect(cert_names).to include "Microsoft Word"
    end
    it "No duplicate certifications can be added" do
      expect{
        @example_certification3 = FactoryGirl.create(:certification,
                                                     name: "Microsoft Excel")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build certification off project" do
      @example_project.certifications.create(name: "Microsoft Powerpoint")
      expect(@example_project.certifications.first.name).to match "Microsoft Powerpoint"
    end
    it "Blank certification cannot be added" do
      expect{
        @example_certification3 = FactoryGirl.create(:certification,
                                                     name: "")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Certification stays in table if project is deleted" do
      @example_project.certifications.create(name: "Microsoft Powerpoint")
      @example_project.destroy
      expect(Certification.all.count).to eq 3
    end
  end
  # Revisit design here - necessary for these to be separate tables?
  describe "Project construction experience" do
    before(:each) do
      @example_project = FactoryGirl.create(:project)
      @example_experience = FactoryGirl.create(:construction_experience,
                                               name: "Well")
      @example_experience2 = FactoryGirl.create(:construction_experience,
                                                name: "Road")
    end
    it "Add multiple construction experiences to project" do
      @example_project.construction_experiences << [@example_experience, @example_experience2]
      expect(@example_project.construction_experiences.count).to eq 2
    end
    it "Get construction experience name" do
      @example_project.construction_experiences << [@example_experience, @example_experience2]
      names = @example_project.construction_experiences.pluck("name")
      expect(names).to include "Well"
      expect(names).to include "Road"
    end
    it "No duplicate construction experiences can be added" do
      expect{
        @example_experience3 = FactoryGirl.create(:construction_experience,
                                                  name: "Well")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build construction experience off project" do
      @example_project.construction_experiences.create(name: "Solar")
      expect(@example_project.construction_experiences.first.name).to match "Solar"
    end
    it "Blank construction experience cannot be added" do
      expect{
        @example_experience3 = FactoryGirl.create(:construction_experience,
                                                  name: "")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "construction experience stays in table if project is deleted" do
      @example_project.construction_experiences.create(name: "Solar")
      @example_project.destroy
      expect(ConstructionExperience.all.count).to eq 3
    end
  end
  describe "Project design experience" do
    before(:each) do
      @example_project = FactoryGirl.create(:project)
      @example_experience = FactoryGirl.create(:design_experience,
                                               name: "Well")
      @example_experience2 = FactoryGirl.create(:design_experience,
                                                name: "Road")
    end
    it "Add multiple design experiences to project" do
      @example_project.design_experiences << [@example_experience, @example_experience2]
      expect(@example_project.design_experiences.count).to eq 2
    end
    it "Get design experience name" do
      @example_project.design_experiences << [@example_experience, @example_experience2]
      names = @example_project.design_experiences.pluck("name")
      expect(names).to include "Well"
      expect(names).to include "Road"
    end
    it "No duplicate design experiences can be added" do
      expect{
        @example_experience3 = FactoryGirl.create(:design_experience,
                                                  name: "Well")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    it "Build design experience off project" do
      @example_project.design_experiences.create(name: "Solar")
      expect(@example_project.design_experiences.first.name).to match "Solar"
    end
    it "Blank design experience cannot be added" do
      expect{
        @example_experience3 = FactoryGirl.create(:design_experience,
                                                  name: "")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Design experience stays in table if project is deleted" do
      @example_project.design_experiences.create(name: "Solar")
      @example_project.destroy
      expect(DesignExperience.all.count).to eq 3
    end
  end
end
