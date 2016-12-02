require 'spec_helper'

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

RSpec.describe User, "#last_name" do 
    context "when the user first enters in their last name" do 
        it "will save the age into the age field" do
            user = User.new
            user.last_name = "Smith"
            expect(user.last_name).to eq "Smith"
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

