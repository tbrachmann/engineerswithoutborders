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

