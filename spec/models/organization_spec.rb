require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { Organization.new }

  it "exists" do
    organization
  end

  describe "attributes" do
    it "has an email" do
      expect(organization).to respond_to(:email)
    end

    it "has a name" do
      expect(organization).to respond_to(:name) 
    end

    it "has a phone number" do
      expect(organization).to respond_to(:phone) 
    end

    it "has a status" do
      expect(organization).to respond_to(:status) 
    end
    
    it "has a primary name" do
      expect(organization).to respond_to(:primary_name) 
    end
    
    it "has a secondary name" do
      expect(organization).to respond_to(:secondary_name)
    end

    it "has a secondary phone number" do
      expect(organization).to respond_to(:secondary_phone) 
    end
  end

  describe "asscociations" do
    it "has many users" do
      expect(organization).to have_many(:users)
    end

    it "has many tickets" do
      expect(organization).to have_many(:tickets) 
    end
    
    it "has and belongs to many resource categories" do
      expect(organization).to have_and_belong_to_many(:resource_categories) 
    end
    
    
  end
  

end
