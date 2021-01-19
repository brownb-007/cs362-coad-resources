require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) { Region.new }

  it { is_expected.to respond_to(:name) }

  describe "validations" do
    it "validates the length of name" do
      expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

  end

end
