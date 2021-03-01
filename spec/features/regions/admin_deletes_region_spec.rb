require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  
  specify "Admin deletes a region" do
    region = Region.create(name: "fake region")
    log_in_as(admin)
    visit region_path(region)
    click_on "Delete"
    expect(page.body).to have_text(region.name)
    expect(page.body).to have_text("Region #{region} was deleted. Associated tickets now belong to the 'Unspecified' region.")
  end
end
