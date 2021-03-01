require 'rails_helper'

RSpec.describe 'Viewing Regions', type: :feature do
  let(:admin) { admin = create(:user, :admin) }
  
  it "shows a list of region names" do
    region = Region.create(name: "fake region")
    log_in_as(admin)
    visit regions_path
    expect(page.body).to have_text(region.name) 
  end

  it "shows details of a region" do
    region = Region.create(name: "fake region")
    ticket = Ticket.create(region: region)
    log_in_as(admin)
    visit region_path(region)
    expect(page.body).to have_text(region.name)
    expect(page.body).to have_text("Tickets")
  end
end
