require 'rails_helper'

def signup(name)
  visit '/'
  click_link 'Sign Up'
  fill_in "Username", with: name
  fill_in "Password", with: "Pa55w0rd"
  click_button "Submit"
end

def login(name)
  visit '/'
  click_link 'Login'
  fill_in "Username", with: name
  fill_in "Password", with: "Pa55w0rd"
  click_button "Login"
end
