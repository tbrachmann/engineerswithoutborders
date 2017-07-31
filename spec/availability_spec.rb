require 'rails_helper'

RSpec.describe Availability, :type => :model do
  describe "Build Availability" do
    before(:each) do
      @example_availability = FactoryGirl.create(:availability, id: 3)
    end
    
    it "Testing to_s" do
      expect(@example_availability.to_s).to eq "Monday Afternoon, Monday Evening, Thursday Afternoon"
    end
  end
end