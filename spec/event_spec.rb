require 'spec_helper'

RSpec.describe Event, "#name" do 
    context "when the user enters in a name for a new event" do 
        it "will save the name into the name field" do
            event = Event.new
            event.name = "Habitat for Humanity"
            expect(event.name).to eq "Habitat for Humanity"
        end
    end
end

RSpec.describe Event, "#description" do 
    context "when the user enters in a description for a new event" do 
        it "will save the description into the field" do
            event = Event.new
            event.description = "Building houses for the less fortunate."
            expect(event.description).to eq "Building houses for the less fortunate."
        end
    end
end

RSpec.describe Event, "#location" do 
    context "when the user enters in a location for a new event" do 
        it "will save the location into the field" do
            event = Event.new
            event.location = "Berkeley"
            expect(event.location).to eq "Berkeley"
        end
    end
end


