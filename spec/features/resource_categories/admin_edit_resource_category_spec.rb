require 'rails_helper'

RSpec.describe 'Editing a Resource Category', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  let(:resource_category) { resource_category = create(:resource_category) }

  specify "Admin successfully edits a resource category" do
    log_in_as(admin)
    visit resource_category_path(resource_category)
    click_on "Edit Resource Category"
    expect(page.body).to have_text("Editing #{resource_category}")
    fill_in "Name",	with: "Fake Edited Resource Category"
    click_on "Save changes"
    expect(page.body).to have_text("Category successfully updated")
  end
end
