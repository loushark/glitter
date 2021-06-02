require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "User can create a post" do
    visit '/'
    click_link 'Sign Up'
    fill_in "Username", with: "Sparkle_Dino"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Submit"
    click_link 'Sprinkle some glitter'
    expect(page).to have_content("Sprinkle some glitter!")
    fill_in "body", with: "This is my first glitter"
    click_button "sprinkle"
    expect(page).to have_content("This is my first glitter")
  end

  scenario "User can view all posts" do
    visit '/'
    click_link 'Sign Up'
    fill_in "Username", with: "Sparkle_Dino"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Submit"
    click_link 'Sprinkle some glitter'
    expect(page).to have_content("Sprinkle some glitter!")
    fill_in "body", with: "This is my first glitter"
    click_button "sprinkle"
    click_link 'Sprinkle some glitter'
    fill_in "body", with: "This is my second glitter"
    click_button "sprinkle"
    expect(page).to have_content("This is my first glitter")
    expect(page).to have_content("This is my second glitter")
  end
end
