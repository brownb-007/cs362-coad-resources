require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { build(:region) }

  describe "Attributes" do
    it { is_expected.to respond_to(:name) }
  end
  
  describe "Associations" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to have_many(:tickets) } 
  end
   
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive() }
  end

  describe "Methods" do
    describe "@to_s" do
      it "has a string representation of name" do
        expect(build(:region, name: "Fake").to_s).to  eq("Fake")
      end
    end
    
    it "is expected to find or create a region with unspecified as a name" do
      expect(Region.unspecified.name).to eq('Unspecified')
    end
  end
end
