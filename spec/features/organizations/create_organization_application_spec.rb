require "rails_helper"

RSpec.describe "Creating an Organization Application", type: :feature do
  let(:user) { create(:user, :mem_of_org) }

  describe "User interacts with org application" do
    specify "User creates a new application" do
      log_in_as(user)
      create(:user, :admin);
      visit dashboard_path
      click_on "Create Application"
      choose("organization_agreement_one_true")
    	choose("organization_agreement_two_true")
    	choose("organization_agreement_three_true")
    	choose("organization_agreement_four_true")
    	choose("organization_agreement_five_true")
    	choose("organization_agreement_six_true")
    	choose("organization_agreement_seven_true")
    	choose("organization_agreement_eight_true")
    	fill_in "organization_primary_name", with: "Fake Primary Name"
      fill_in "organization_name", with: "Fake Name"
      fill_in "organization_title", with: "Fake Title"
      fill_in "organization_phone", with: "8888888888"
      fill_in "organization_secondary_name", with: "Fake Secondary Name"
      fill_in "organization_secondary_phone", with: "9999999999"
      fill_in "organization_email", with: "fake@mail.com"
      fill_in "organization_description", with: "Fake Description"
    	choose("organization_transportation_yes")
    	click_button "Apply"
    	expect(page).to have_text("Application Submitted")
    end
  end
end
