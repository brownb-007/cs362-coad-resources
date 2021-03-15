require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  let(:ticket) { create(:ticket) }
  
  specify "Admin deletes a ticket" do
    log_in_as(admin)
    visit ticket_path(ticket.id)
    click_on "Delete"
    expect(page).to have_text("Ticket #{ticket.id} was deleted")
  end
end