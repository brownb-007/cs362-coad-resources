require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { Organization.new }

  it "instantiate an organization object" do
    organization
  end

  describe "attributes" do
    it "has an email" do
      expect(organization).to respond_to(:email)
    end

    it "has a name" do
      expect(organization).to respond_to(:name) 
    end
    
  end
  

end
