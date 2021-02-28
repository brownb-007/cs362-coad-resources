require 'rails_helper'

RSpec.describe 'Viewing Regions', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  
  it "shows a list of region names" do
    region = Region.create(name: "fake region")
    log_in_as(admin)
    visit regions_path
    expect(page.body).to have_text(region.name) 
  end
  
end
