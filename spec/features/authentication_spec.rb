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

  scenario "User can login" do
    visit '/'
    click_link 'Sign Up'
    fill_in "Username", with: "Sparkle_Dino"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Submit"
    click_link 'Logout'
    click_link 'Login'
    fill_in "Username", with: "Sparkle_Dino"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Login"
    expect(page).to have_link("Logout")
    expect(page).to have_content("Welcome Sparkle_Dino")
  end

  scenario "User can logout" do
    visit '/'
    click_link 'Sign Up'
    fill_in "Username", with: "Sparkle_Dino"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Submit"
    click_link 'Logout'
    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Login")
    expect(page).to have_content("Welcome Guest")
  end
end
