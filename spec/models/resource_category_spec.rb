require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) { ResourceCategory.new }

  describe "Attributes" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:active) }
  end

  describe "Associations" do
    it { is_expected.to have_and_belong_to_many(:organizations) }
    it { is_expected.to have_many(:tickets) }
  end

  describe "Validations" do
    
  end

end
