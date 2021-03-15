require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
  specify "Person creates a ticket" do
    region = Region.create(name: "Fake region")
    resource_category = ResourceCategory.create(name: "Fake category")
    visit root_path
    click_on "Get Help"
    fill_in "Full Name", with: "Fake"
    fill_in "Phone Number", with: "1234561234"
    select region.name, from: "Region"
    select resource_category.name, from: "Resource Category"
	  fill_in "Description", with: "Fake description"
	  click_on "Send this help request"
    visit ticket_submitted_path
    expect(page).to have_text("Ticket Submitted") 
  end
end
