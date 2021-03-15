require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
  let(:organization) { create(:organization, :approved) }
  let(:user) { create(:user, :mem_of_org, organization: organization) }
  let(:ticket) { create(:ticket) }
  let(:admin) { admin = create(:user, :admin) }

  specify "Organization closes a ticket" do
    log_in_as(user)
    visit ticket_path(ticket.id)
    click_on "Capture"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    click_on "Close"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page).to have_text("Status Closed")
  end

  specify "Organization cant close a closed ticket" do
    log_in_as(user)
    visit ticket_path(ticket.id)
    click_on "Capture"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    click_on "Close"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page).to have_text("Status Closed")
    expect(page).to_not have_link("Close")
  end

  specify "Admin closes a ticket" do
    log_in_as(admin)
    visit ticket_path(ticket.id)
    click_on "Close"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page).to have_text("Status Closed")
  end

  specify "Once an Admin closes a ticket it cant be released" do
    log_in_as(admin)
    visit ticket_path(ticket.id)
    click_on "Close"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page).to have_text("Status Closed")
    expect(page).to_not have_link("Release")
  end
end
