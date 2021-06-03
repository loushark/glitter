require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "User can create a post" do
    signup("Sparkle_Dino")
    click_link 'Sprinkle some glitter'
    expect(page).to have_content("Sprinkle some glitter!")
    fill_in 'post_body', with: "This is my first glitter"
    click_button "sprinkle"
    expect(page).to have_content("This is my first glitter")
  end

  scenario "User cannot create a post when not logged in" do
    visit '/'
    expect(page).not_to have_content("Sprinkle some glitter!")
  end

  scenario "User can view all posts" do
    signup("Sparkle_Dino")
    click_link 'Sprinkle some glitter'
    expect(page).to have_content("Sprinkle some glitter!")
    fill_in 'post_body', with: "This is my first glitter"
    click_button "sprinkle"
    click_link 'Sprinkle some glitter'
    fill_in 'post_body', with: "This is my second glitter"
    click_button "sprinkle"
    expect(page).to have_content("This is my first glitter")
    expect(page).to have_content("This is my second glitter")
  end

  scenario "User can see who posted" do
    signup("Sparkle_Dino")
    click_link 'Sprinkle some glitter'
    expect(page).to have_content("Sprinkle some glitter!")
    fill_in 'post_body', with: "This is my first glitter"
    click_button "sprinkle"
    click_link 'Sprinkle some glitter'
    fill_in 'post_body', with: "This is my second glitter"
    click_button "sprinkle"
    expect(page).to have_content("posted by Sparkle_Dino")
  end

  scenario "User can delete their post" do
    signup("Sparkle_Dino")
    click_link 'Sprinkle some glitter'
    fill_in 'post_body', with: "This is my first glitter"
    click_button "sprinkle"
    expect(page).to have_link("sweep up glitter")
    click_link 'sweep up glitter'
    expect(page).not_to have_link("sweep up glitter")
  end
end
