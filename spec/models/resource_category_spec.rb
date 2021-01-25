require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) { ResourceCategory.new }

  describe "Attributes" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:active) }
  end

  describe "Associations" do
    
  end

  describe "Validations" do
    
  end

end
