require 'rails_helper'

RSpec.describe 'Releasing a ticket', type: :feature do
  let(:organization) { create(:organization, :approved) }
  let(:user) { create(:user, :mem_of_org, organization: organization) }
  let(:ticket) { create(:ticket) }
  let(:admin) { admin = create(:user, :admin) }

  specify "Organization releases a ticket" do
    log_in_as(user)
    visit ticket_path(ticket.id)
    click_on "Capture"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    click_on "Release"
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page).to have_text("Captured by\n")
  end
end
