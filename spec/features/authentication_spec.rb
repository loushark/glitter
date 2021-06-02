require 'rails_helper'

RSpec.feature "Authentication of a user", type: :feature do
  scenario "User can sign up" do
    signup("Sparkle_Dino")
    expect(page).to have_link("Logout")
    expect(page).to have_content("welcome Sparkle_Dino")
  end

  scenario "User can login" do
    signup("Sparkle_Dino")
    click_link 'Logout'
    login("Sparkle_Dino")
    expect(page).to have_link("Logout")
    expect(page).to have_content("welcome Sparkle_Dino")
  end

  scenario "User can logout" do
    signup("Sparkle_Dino")
    click_link 'Logout'
    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Login")
    expect(page).to have_content("welcome Guest")
  end
end
