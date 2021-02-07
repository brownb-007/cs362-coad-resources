require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) { build(:resource_category) }
  let(:resource_category_active) { create(:resource_category, :active) }
  let(:resource_category_inactive) { create(:resource_category, :inactive) }

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
    it "@to_s, has a string representation of name" do
      resource_category = build(:resource_category, name: "Fake")
      expect(resource_category.to_s).to  eq("Fake")
    end

    it "is expected to find or create a resource_category with unspecified as a name" do
      expect(ResourceCategory.unspecified.name).to eq('Unspecified')
    end

    describe "Activity statuses" do 
      it "@activate has a status of active" do
        expect(resource_category.active).to be_truthy
      end

      it "@deactivate has a deactivated activity status" do
        expect(resource_category.deactivate).to be_truthy
        expect(resource_category.active).to be_falsey
      end

      it "@inactive? detemines if the resource category is active or inactive" do 
        expect(resource_category.inactive?).to be_falsey
      end
    end
  end


  describe "Scopes" do
    it "looks for all of the active resource_categories" do
      expect(ResourceCategory.active).to include(resource_category_active)
      expect(ResourceCategory.active).to_not include(resource_category_inactive)
    end

    it "looks for all of the inactive resource_categories" do
      expect(ResourceCategory.inactive).to include(resource_category_inactive)
      expect(ResourceCategory.inactive).to_not include(resource_category_active)
    end
  end
end
