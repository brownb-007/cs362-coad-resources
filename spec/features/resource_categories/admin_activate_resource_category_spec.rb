require 'rails_helper'

RSpec.describe 'Activating a Resource Category', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  let(:resource_category) { resource_category = create(:resource_category) }

  specify "Admin successfully activates a resource category" do
    log_in_as(admin)
    visit resource_category_path(resource_category)
    click_on "Deactivate"
    expect(page.body).to have_text("Category deactivated")
    click_on "Activate"
    expect(page.body).to have_text("Category activated")
  end
end