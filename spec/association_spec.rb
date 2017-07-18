require 'rails_helper'

# User associations: Project (as Volunteer through VolunteerRelationship), Roles (has_one), Skills (HABTM), Certifications (HABTM), Experience (HABTM)

RSpec.describe User, :type => :model do
  before(:each) do
    @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
    @example_project = FactoryGirl.create(:project)
  end
  describe "As a volunteer" do
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
  # Add role, skill, experience tests here
end

RSpec.describe User, :type => :model do
  before(:each) do
    @example_manager = FactoryGirl.create(:manager, password: "asdfghjkl")
    @example_project = FactoryGirl.create(:project)
  end
  describe "As a manager" do
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
end

# Project associations: Volunteers (Users through VolunteerRelationships), and Managers
# (Users through ManagerRelationships)

RSpec.describe Project, :type => :model do
  before(:each) do
    @example_project = FactoryGirl.create(:project)
  end
  describe "Volunteers" do
    before(:each) do
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
end
