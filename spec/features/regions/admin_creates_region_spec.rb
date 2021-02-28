require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  
  specify "Admin creates a region" do
    log_in_as(admin)
    click_link "Regions"
    click_on "Add Region"
    expect(page.body).to have_content("Add a region")
    fill_in "Name",	with: "Fake Region"
    click_button "Add Region"
    expect(page.body).to have_content("Region successfully created.")
  end
end
