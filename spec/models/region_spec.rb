require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { Region.new }

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

  

end
