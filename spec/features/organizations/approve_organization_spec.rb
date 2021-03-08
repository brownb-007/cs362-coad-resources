require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  let(:organization) { organization = build(:organization, :submitted)}
  describe "Admin interacts with a submitted organization" do
    specify "Admin approves a submitted organization" do
      log_in_as(admin)
      visit organizations_path(organization)
      click_on 'Approve'
      expect(page).to have_text('Approved')
    end

    specify "Admin can't re-approve approved organizations" do
      log_in_as(admin)
      visit organizations_path
      click_on 'Approved'
      visit organization
      expect(page).not_to have_link('Approved')
    end
  end
end
