require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  let(:organization) { create(:organization, :approved) }
  let(:user) { create(:user, :mem_of_org, organization: organization) }
  let(:ticket) { create(:ticket) }

  specify "Organization captures a ticket" do
    log_in_as(user)
    visit ticket_path(ticket.id)
    click_on "Capture"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page).to have_text("Captured by #{organization}")
  end

  specify "Organization cant capture a captured ticket" do
    log_in_as(user)
    visit ticket_path(ticket.id)
    click_on "Capture"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page).to have_text("Captured by #{organization}")
    visit ticket_path(ticket.id)
    expect(page).to_not have_link("Capture")
  end
end
