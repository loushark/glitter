require 'rails_helper'

RSpec.describe "Users", type: :request do

  it "signs up a new user and saves the session" do
    get "/users/new"
    expect(response).to have_http_status(:success)
    expect(response).to render_template(:new)

    post signup_path, :params => { :user => { username: "charming_snail", password: "password1" } }
    expect(response).to redirect_to('/')
    follow_redirect!
    expect(response.body).to include("welcome charming_snail!")
  end

  it "will not sign up a new user with the same username" do
    # user = User.create(username: "charming_snail", password: "password1")
    existing_user = create(:user)
    # post signup_path, :params => { :user => { username: "charming_snail", password: "password1" } }
    post signup_path, :params => { :user => { username: existing_user.username, password: "password" } }
    expect(response).to render_template(:new)
    expect(response.body).to include("Sign Up!")
  end
end
