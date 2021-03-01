require 'rails_helper'

RSpec.describe 'Editing Region', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  
  specify "Admin edits a region" do
    region = Region.create(name: "fake region")
    log_in_as(admin)
    visit region_path(region)
    click_on "Edit Region"
    expect(page.body).to have_text(region.name)
    fill_in "Name",	with: "Fake Edited Region"
    click_button "Save Changes"
    expect(page.body).to have_text("Region successfully updated")
  end
end