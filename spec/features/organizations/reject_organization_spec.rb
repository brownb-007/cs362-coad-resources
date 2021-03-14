require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  let(:organization) { organization = build(:organization, :submitted)}
  describe "Admin interacts with a submitted organization" do
    specify "Admin rejects a submitted organization" do
      log_in_as(admin)
      visit organizations_path
      click_on "Pending"
      visit organizations_path(organization)
      click_on "Reject"
      expect(page).to have_text("Rejected")
    end
  end
end
