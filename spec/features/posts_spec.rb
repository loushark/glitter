require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "User can create a post" do
    visit '/'
    click_link 'Sprinkle some glitter'
    expect(page).to have_content("Sprinkle some glitter!")
    fill_in "post", with: "This is my first glitter"
    click_button "Sprinkle"
    expect(page).to have_content("This is my first glitter")
  end
end
