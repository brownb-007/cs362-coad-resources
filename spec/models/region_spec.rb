require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) { Region.new }

  it "exists" do
    region
  end

  it "has a name" do
    expect(region).to respond_to(:name)
  end
  
  describe "validations" do
    it "validates the presence of name" do
      expect(region).to validate_presence_of(:name)
    end

  end

end
