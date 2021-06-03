require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "User can like a post" do
    signup("Sparkle_Dino")
    click_link 'Sprinkle some glitter'
    expect(page).to have_content("Sprinkle some glitter!")
    fill_in 'post_body', with: "This is my first glitter"
    click_button "sprinkle"
    click_link 'Logout'
    signup("Charming_snail")
    expect(page).to have_content("0 sparkles")
    click_button 'add sparkles'
    expect(page).to have_content("1 sparkle")
  end

  scenario "User can unlike a post" do
    signup("Sparkle_Dino")
    click_link 'Sprinkle some glitter'
    expect(page).to have_content("Sprinkle some glitter!")
    fill_in 'post_body', with: "This is my first glitter"
    click_button "sprinkle"
    click_link 'Logout'
    signup("Charming_snail")
    expect(page).to have_content("0 sparkles")
    click_button 'add sparkles'
    expect(page).to have_content("1 sparkle")
    click_button 'remove sparkles'
    expect(page).to have_content("0 sparkles")
  end

end
