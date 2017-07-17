require 'rails_helper'

# TODO: test destroying as well

RSpec.describe User, :type => :model do
  describe "Regular user" do
    before(:each) do
      #Need to manually specify the password here, otherwise it won't work,
      #because of "Strong Params"
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      #operating under the assumption that a project can be created without
      #a manager.
      @example_project = FactoryGirl.create(:project)
    end
    it "Has a valid factory" do
      expect(@example_user).to be_valid
      expect(@example_project).to be_valid
    end
    context "When a user is added to a project" do
      it "user will be linked to a project" do
        @example_user.projects << @example_project
        expect(@example_user.projects.count).to eq 1
        expect(@example_user.projects.first.name).to match @example_project.name
      end
    end
    context "When a user is a part of multiple projects" do
      before(:each) do
        @example_project2 = FactoryGirl.create(:project)
      end
      it "will have multiple projects" do
        @example_user.projects << @example_project
        @example_user.projects << @example_project2
        expect(@example_user.projects.count).to eq 2
      end
    end
  end
  describe "Manager" do
    before(:each) do
      @example_manager = FactoryGirl.create(:manager, password: "asdfghjkl")
      @example_manager2 = FactoryGirl.create(:manager, password: "asdfghjkl")
      @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      #operating under the assumption that a project can be created without
      #a manager.
      @example_project = FactoryGirl.build(:project)
      @example_project2 = FactoryGirl.build(:project)
    end
    it "has a valid factory" do
      expect(@example_manager).to be_valid
      expect(@example_project).to be_valid
    end
    context "Manager has one project" do
      before(:each) do
        #@example_manager.manages << @example_project
        @example_project.managers << @example_manager
        @example_user.projects << @example_project
      end
      it "will be linked to its project" do
        expect(@example_manager.manages.first.name).to match @example_project.name
        #expect(@example_manager.project.name).to match @example_project.name
      end
      it "project will be linked to its manager" do
        expect(@example_project.managers.first.first_name)
          .to match @example_manager.first_name
      end
      it "user will not manage project" do
        expect(@example_user.manages.count).to eq 0
      end
      it "user will not be a manager of project" do
        expect(@example_project.managers.count).to eq 1
        expect(@example_project.volunteers.count).to eq 1
      end
      it "manager has correct role" do
        expect(@example_project.role_of(@example_manager)).to include "manager"
      end
      it "manager also assigns himself a role" do
        @example_project.assign_role(@example_manager, "programmer")
        expect(@example_project.role_of(@example_manager))
          .to match_array ["programmer", "manager"]
      end
    end
    context "Manager has multiple projects" do
      before(:each) do
        @example_manager.manages << @example_project
        @example_manager.manages << @example_project2
        @example_user.projects << @example_project
      end
      it "will have multiple projects" do
        expect(@example_manager.manages.count).to eq 2
      end
      it "both projects will point to their manager" do
        expect(@example_project.managers.count).to eq 1
        expect(@example_project2.managers.count).to eq 1
      end
    end
  end
end


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
      expect(@example_project.distinct_volunteers.count).to eq 2
    end
    it "catches error and returns false if volunteer does not exist" do
        @fake_user = instance_double('User', id: 10)
        expect(@example_project.assign_role(@fake_user, "cook")).to be_falsy
    end
    it "Check the roles of volunteers" do
      @example_project.volunteers << @example_user
      @example_project.assign_role(@example_user, "programmer")
      @example_project.add_with_role(@example_user2, "cook")
      expect(@example_project.role_of(@example_user)).to include "programmer"
      expect(@example_project.role_of(@example_user2)).to include "cook"
    end
    it "volunteer can have multiple roles" do
      @example_project.add_with_role(@example_user, "programmer")
      @example_project.assign_role(@example_user, "cook")
      expect(@example_project.role_of(@example_user))
        .to match_array ["programmer", "cook"]
    end
    it "volunteer with multiple roles is still returned as one volunteer" do
      @example_project.add_with_role(@example_user, "programmer")
      @example_project.assign_role(@example_user, "cook")
      expect(@example_project.distinct_volunteers.count).to eq 1
    end
    it "Remove volunteers" do
      @example_project.volunteers << @example_user
      @example_project.volunteers.delete(@example_user.id)
      expect(@example_project.volunteers.count).to eq 0
    end
    it "Destroy volunteer" do
      @example_project.volunteers << @example_user
      @example_user.destroy
      expect(@example_project.volunteers.count).to eq 0
    end
  end
  describe "Managers" do
    it "Adding managers" do
    end
    it "Having multiple managers" do
    end
    it "No duplicate managers" do
    end
    it "Removing managerts" do
    end
  end
end
