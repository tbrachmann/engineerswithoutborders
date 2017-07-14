require 'rails_helper'

RSpec.describe User, "#first_name" do 
    context "when the user first enters in their first name" do 
        it "will save the name into the name field" do
            user = User.new
            user.first_name = "John"
            expect(user.first_name).to eq "John"
        end
    end
end

RSpec.describe User, "#last_name" do 
    context "when the user first enters in their last name" do 
        it "will save the name into the name field" do
            user = User.new
            user.last_name = "Smith"
            expect(user.last_name).to eq "Smith"
        end
    end
end

RSpec.describe User, "#age" do 
    context "when the user first enters in their age" do 
        it "will save the name into the age field" do
            user = User.new
            user.age = 18
            expect(user.age).to eq 18
        end
    end
end

RSpec.describe User, "#education" do 
    context "when the user first enters in their education status" do 
        it "will save the education status into the education field" do
            user = User.new
            user.education = "GED"
            expect(user.education).to eq "GED"
        end
    end
end

RSpec.describe User, "#school" do 
    context "when the user first enters in their school name" do 
        it "will save the school name into the school field" do
            user = User.new
            user.school = "UC Berkeley"
            expect(user.school).to eq "UC Berkeley"
        end
    end
end

RSpec.describe User, "#expertise" do 
    context "when the user first enters in their expertise status" do 
        it "will save their expertise into the expertise field" do
            user = User.new
            user.expertise = "Civil Engineering"
            expect(user.expertise).to eq "Civil Engineering"
        end
    end
end

RSpec.describe User, "#certifications" do 
    context "when the user first enters in their certifications" do 
        it "will save their certifications into the certificartions field" do
            user = User.new
            user.certifications = "Chemical"
            expect(user.certifications).to eq "Chemical"
        end
    end
end

RSpec.describe User, "#time_commitment" do 
    context "when the user first enters in their time commitment" do 
        it "will save their time commitment into the time commitment field" do
            user = User.new
            user.time_commitment = "1-3 hours every month"
            expect(user.time_commitment).to eq "1-3 hours every month"
        end
    end
end

RSpec.describe User, "#travel" do 
    context "when the user first enters in their travel ability" do 
        it "will save their travel ability into the travel field" do
            user = User.new
            user.travel = "Yes"
            expect(user.travel).to eq "Yes"
        end
    end
end

# Association tests added by TRB
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
    context "When a new user is created" do
      # I'm confused. Sometimes these return nil, sometimes they return a 
      # CollectionProxy
      # Nil if its a singular relation and CollectionProxy otherwise?
      it "will not be linked to any projects" do
        expect(@example_user.projects.count).to eq 0
      end
      it "will not manage any projects" do
        expect(@example_project.managers.count).to eq 0
      end
      it "will not be a part of any projects" do
        expect(@example_project.volunteers.count).to eq 0
      end
    end
    context "When a user is added to a project" do
      before(:each) do
        @example_user2 = FactoryGirl.create(:user, password: "asdfghjkl")
        @example_user3 = FactoryGirl.create(:user, password: "asdfghjkl")
        #No role
        @example_user.projects << @example_project
        #with role
        @example_project.add_with_role(@example_user2, "programmer")
        #assign role after
        @example_user3.projects << @example_project
        @example_project.assign_role(@example_user3, "engineer")
        @example_project.assign_role(@example_user3, "cook")
      end
      it "user will be linked to a project" do
        expect(@example_user.projects.count).to eq 1
        expect(@example_user.projects.first.name).to match @example_project.name
      end
      it "users will be in the list of project's volunteers" do
        expect(@example_project.volunteers.count).to eq 3
        expect(@example_project.volunteers.first.first_name)
          .to match @example_user.first_name
      end
      it "user 2 and 3 will have correct roles" do
        expect(@example_project.role_of(@example_user)).to be_nil
        expect(@example_project.role_of(@example_user2)).to include "programmer"
        expect(@example_project.role_of(@example_user3)).to include "engineer"
      end
      it "user can have multiple roles" do
        @example_project.assign_role(@example_user2, "cook")
        expect(@example_project.role_of(@example_user2))
          .to match_array ["programmer", "cook"]
      end
      it "catches error and returns false if volunteer does not exist" do
        @fake_user = instance_double('User', id: 10)
        expect(@example_project.assign_role(@fake_user, "cook")).to be_falsy
      end
    end
    context "When a user is a part of multiple projects" do
      before(:each) do
        @example_user2 = FactoryGirl.create(:user, password: "adfghjkl")
        @example_project2 = FactoryGirl.create(:project)
        @example_user.projects << @example_project
        @example_user.projects << @example_project2
        @example_user2.projects << @example_project
        @example_user2.projects << @example_project2
      end
      it "will have multiple projects" do
        expect(@example_user.projects.count).to eq 2
      end
      it "projects will have multiple users" do
        expect(@example_project.volunteers.count).to eq 2
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
        @example_manager.manages << @example_project
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
