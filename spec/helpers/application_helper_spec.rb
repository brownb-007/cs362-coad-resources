require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    it "has a default title" do
      expect(helper.full_title("")).to eq("Disaster Resource Network")
    end
    it "merges title given with default title" do
      expect(helper.full_title("fake")).to eq("fake | Disaster Resource Network")
    end
  end
end
