require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { create(:ticket) }
  let(:closed_ticket) { create(:ticket, :closed_ticket) }
  let(:open_ticket) { create(:ticket, :open_ticket) } 
  let(:ticket_is_open_has_organization) { create(:ticket, :open_ticket, :has_organization) }
  let(:ticket_is_closed_has_organization) { create(:ticket, :closed_ticket, :has_organization) }

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
      it "has a string representation of ticket" do
        expect(build(:ticket, id: '98765').to_s).to eq("Ticket " + '98765') 
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
    it "is open tickets" do
      expect(Ticket.open).to include(open_ticket)
      expect(Ticket.open).to_not include(closed_ticket)
    end

    it "is a closed tickets" do
      expect(Ticket.closed).to include(closed_ticket)
      expect(Ticket.closed).to_not include(open_ticket)
    end
    
    it "is all organizations tickets that are open rather than just only open without an organization" do
      expect(Ticket.all_organization).to include(ticket_is_open_has_organization)
      expect(Ticket.all_organization).to_not include(open_ticket)
    end

    it "is an individual organization ticket that is closed" do
      expect(Ticket.closed_organization(ticket_is_closed_has_organization.organization.id)).to include(ticket_is_closed_has_organization)
      expect(Ticket.closed_organization(ticket_is_closed_has_organization.organization.id)).to_not include(ticket_is_open_has_organization)
    end

    it "is an individual organization ticket that is open" do
      expect(Ticket.organization(ticket_is_open_has_organization.organization.id)).to include(ticket_is_open_has_organization)
      expect(Ticket.organization(ticket_is_open_has_organization.organization.id)).to_not include(ticket_is_closed_has_organization)
    end

    it "is the region a ticket belongs to" do
      expect(Ticket.region(ticket.region.id)).to include(ticket) 
    end

    it "is the resource_category a ticket belongs to" do
      expect(Ticket.resource_category(ticket.resource_category.id)).to include(ticket) 
    end 
  end
end
