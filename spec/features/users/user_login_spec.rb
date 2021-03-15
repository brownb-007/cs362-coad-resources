require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  let(:user) { create(:user) }
  
  specify "Log in as a user" do
    visit login_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_on "Sign in"
    expect(page).to have_text("Signed in successfully")
  end
end
