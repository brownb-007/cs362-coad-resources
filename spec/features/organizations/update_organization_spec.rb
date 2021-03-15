require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
  let(:organization) { create(:organization, :approved) }
  let(:user) { create(:user, :mem_of_org, organization: organization) }

  describe "Organization edits their own organization successfully" do
    specify "Edit organization" do
      log_in_as(user)
      create(:user, :admin)
      expect(page).to have_text("Edit Organization")
      click_on "Edit Organization"
      fill_in "Name", with: "Fake Org"
      fill_in "Phone", with: "555-555-555"
      fill_in "Email", with: "fake@mail.com"
      fill_in "Description", with: "CHANGE FAKE"
      click_on "Update Resource"
      expect(current_path).to eq(organization_path(organization))
      expect(page).to have_text("Organization Name")
    end
  end
end
