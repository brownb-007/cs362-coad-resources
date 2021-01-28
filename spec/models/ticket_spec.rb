require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let (:ticket) { Ticket.new }

  describe "Attributes" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:phone) }
    it { is_expected.to respond_to(:closed) }
    it { is_expected.to respond_to(:closed_at) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:region) }
    it { is_expected.to belong_to(:resource_category) }
    it { is_expected.to belong_to(:organization) }
  end

  describe "Validations" do
    
  end

end
