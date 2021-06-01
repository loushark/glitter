require 'rails_helper'

RSpec.feature "Authentication of a user", type: :feature do
  scenario "User can sign up" do
    visit '/'
    click_link 'Sign Up'
    fill_in "Username", with: "Sparkle_Dino"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Submit"
    expect(page).to have_link("Logout")
    expect(page).to have_content("Welcome Sparkle_Dino")
  end
end
