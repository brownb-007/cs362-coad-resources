require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  let(:resource_category) { resource_category = create(:resource_category) }

  specify "Admin successfully deletes a resource category" do
    log_in_as(admin)
    visit resource_category_path(resource_category)
    click_on "Delete"
    expect(page).to have_text("Category #{resource_category} was deleted")
  end
end
