require 'rails_helper'

RSpec.feature "Authentication of a user", type: :feature do
  scenario "User can sign up" do
    visit '/'
    expect(page).to have_content("Sign Up")
  end
end
