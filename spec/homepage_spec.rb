require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "There is a homepage" do
    visit '/'
    expect(page).to have_content("Glitter")
  end
end
