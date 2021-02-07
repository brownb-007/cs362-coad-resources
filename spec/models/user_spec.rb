require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }

  describe "Attributes" do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:role) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:organization).optional }
  end

  describe "Validations" do
    it { is_expected.to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
    it { is_expected.to allow_value("fake@mail.com").for(:email) }
    it { is_expected.to_not allow_value("mail.com", "fake").for(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive() }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe "Methods" do
    describe "@to_s" do 
      it "has a string representation of email" do
        user_email = User.new(email: "fake@mail.com")
        expect(user_email.to_s).to eq("fake@mail.com") 
      end
    end

    describe "@set_default_role" do
      it "assigns a default role to a new user" do
        user.role = :organization
        expect(user.admin?).to eq(false)
      end
      
      it "assigns a admin role to a user" do
        user.role = :admin
        expect(user.admin?).to eq(true)
      end   
    end
  end
end
