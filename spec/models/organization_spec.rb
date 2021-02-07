require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { build(:organization) }

  describe "Attributes" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:status) }
    it { is_expected.to respond_to(:phone) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:rejection_reason) }
    it { is_expected.to respond_to(:liability_insurance) }
    it { is_expected.to respond_to(:primary_name) }
    it { is_expected.to respond_to(:secondary_name) }
    it { is_expected.to respond_to(:secondary_phone) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:transportation) }
  end

  describe "Asscociations" do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:tickets) }
    it { is_expected.to have_and_belong_to_many(:resource_categories) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:primary_name) }
    it { is_expected.to validate_presence_of(:secondary_name) }
    it { is_expected.to validate_presence_of(:secondary_phone) }
    it { is_expected.to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
    it { is_expected.to allow_value("fake@mail.com").for(:email) }
    it { is_expected.to_not allow_value("mail.com", "fake").for(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive() }
    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive() }
    it { is_expected.to validate_length_of(:description).is_at_most(1020).on(:create) }
  end


  describe "Methods" do

    describe "@to_s" do
      it "has a string representation of name" do
        expect(build(:organization, name: 'Fake').to_s).to eq('Fake')
      end 
    end

    describe "@approve" do
      it "is an approved organization" do
        expect(build(:organization, :approved).approve).to  be_truthy
      end
    end
    
    describe "@reject" do
      it "is a rejected organization" do
        expect(build(:organization, :rejected).reject).to  be_truthy
      end
    end
    
    describe "@set_default_status" do
      it "is a submitted organization" do
        expect(build(:organization, :submitted).set_default_status).to  be_truthy
      end
    end
  end
end
