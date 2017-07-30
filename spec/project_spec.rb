require 'rails_helper'

RSpec.describe Project, "#name" do
  context "when a project manager enters a project name" do
    it "saves the value into the name field" do
      project = Project.new
      project.name = "Simple Project"
      expect(project.name).to eq "Simple Project"
    end
  end
end

RSpec.describe Project, "#description" do
  context "when a project manager enters a project description" do
    it "saves the value into the description field" do
      project = Project.new
      project.description = "Simple description for simple project"
      expect(project.description).to eq "Simple description for simple project"
    end
  end
end

RSpec.describe Project, "#volunteer_capacity" do
  context "when a project manager enters the amount of volunteers a project can have" do
    it "saves the value into the volunteer_capacity field" do
      project = Project.new
      project.volunteer_capacity = 100
      expect(project.volunteer_capacity).to eq 100
    end
  end
end

# This use of "volunteers is deprecated."
RSpec.describe Project, "#volunteers" do
  context "when a project manager enters the amount of volunteers currently assinged to a project" do
    it "saves the value into the volunteers field" do
      @project = FactoryGirl.create(:project)
      15.times do
        @example_user = FactoryGirl.create(:user, password: "asdfghjkl")
        @example_user.projects << @project
      end
      #project.volunteers = 15
      expect(@project.volunteers.count).to eq 15
    end
  end
end

RSpec.describe Project, "#location" do
  context "when a project manager enters a project location" do
    it "saves the value into the location field" do
      project = Project.new
      project.location = "Berkeley, CA"
      expect(project.location).to eq "Berkeley, CA"
    end
  end
end

RSpec.describe Project, "#hours_per_week" do
  context "when a project manager enters the time commitment for a project" do
    it "saves the value into the hours_per_week field" do
      project = Project.new
      project.hours_per_week = 5
      expect(project.hours_per_week).to eq 5
    end
  end
end


RSpec.describe Project, "#availability_hash" do
  context "when a project manager views their dashboard" do
    it "it shows the volunteers on the project and their availability" do
      project = Project.new
      example_user = FactoryGirl.create(:user, password: "asdfghjkl")
      example_user.availability = Availability.create(thursday_afternoon: true,
      friday_morning: false, saturday_evening: true, monday_morning: false)
      example_user.save!
      project.volunteers << example_user
      expect(project.availability_hash.length).to eq 2
      expect(project.availability_hash).to eq({"Thursday Afternoon"=>1,
        "Saturday Evening"=>1})
      project.volunteers.first.update_availability({monday_morning: true})
      project.volunteers.first.availability.save!
      expect(project.availability_hash.length).to eq 3
      expect(project.availability_hash).to eq({"Monday Morning"=>1,
        "Thursday Afternoon"=>1, "Saturday Evening"=>1})

    end
  end
end