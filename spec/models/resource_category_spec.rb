require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) { build(:resource_category) }

  describe "Attributes" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:active) }
  end

  describe "Associations" do
    it { is_expected.to have_and_belong_to_many(:organizations) }
    it { is_expected.to have_many(:tickets) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive() }
  end

  describe "Methods" do

    it "#to_s, has a string representation of name" do
      resource_category = build(:resource_category, name: "Fake")
      expect(resource_category.to_s).to  eq("Fake")
    end

    it "is expected to find or create a resource_category with unspecified as a name" do
      expect(ResourceCategory.unspecified.name).to eq('Unspecified')
    end

    


  end
end
