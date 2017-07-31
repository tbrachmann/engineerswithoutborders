require 'rails_helper'

include ApplicationHelper
RSpec.describe ApplicationHelper, "#helper" do
  context "when full_title is called without an argument" do
    it "formats the page title with the base title" do
        expect(full_title()).to eq("Engineers Without Borders")
    end
  end
end

RSpec.describe ApplicationHelper, "#helper" do
  context "when full_title is called with an argument" do
    it "formats the page title with the base title" do
        expect(full_title("Good Page Name")).to eq("Good Page Name | Engineers Without Borders")
    end
  end
end

