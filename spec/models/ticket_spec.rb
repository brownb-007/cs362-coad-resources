require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { create(:ticket) }
  let(:closed_ticket) { create(:ticket, :closed_ticket) }
  let(:open_ticket) { create(:ticket, :open_ticket) } 
  let(:ticket_has_open_organization) { create(:ticket, :open_ticket, :has_organization) }
  let(:ticket_has_closed_organization) { create(:ticket, :closed_ticket, :has_organization) }

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
    it { is_expected.to belong_to(:organization).optional }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { is_expected.to validate_length_of(:description).is_at_most(1020).on(:create) }

    # it "has a valid phone number" do
    #   let(:valid_ticket_number) { create(:ticket, phone = "+311012341234") }
    #   let(:invalid_ticket_number) { create(:ticket, phone = "12345") }
    #   expect(:valid_ticket_number.save!).to 
    #   expect(:invalid_ticket_number.save!).to 
    # end
  end

  describe "Methods" do

    describe "@to_s" do 
      it 'has a string representation of ticket' do
        temp_tick = build(:ticket, id: '98765')
        expect(temp_tick.to_s).to eq('Ticket ' + '98765') 
      end
    end

    describe "@opened?" do
      it "has a status of open and not closed" do
        expect(Ticket.open).to include(open_ticket)
        expect(Ticket.open).to_not include(closed_ticket)
      end
    end
    
    describe "@captured" do
      it "is not captured aaas a defualt" do
        expect(ticket).to_not be_captured
      end
      
      it "is captured if it has an organization" do
        ticket.organization = Organization.new
        expect(ticket).to be_captured
      end
    end
  end

  describe "Scopes" do
    
  end
  

end
