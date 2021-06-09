require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /signup" do
    it "returns http success on getting the sign up form" do
      get signup_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST /signup" do
    it "redirects and returns http success on submission of sign up" do
      post signup_path, :params => { :user => { username: "charming_snail", password: "password1" } }
      expect(response).to redirect_to('/')
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to include("welcome charming_snail")
    end
  end

  describe "GET /login" do
    it "returns http success on getting login form" do
      get login_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST /login" do
    before do
      post signup_path, :params => { :user => { username: "charming_snail", password: "password1" } }
      get "/logout/"
      follow_redirect!
    end

    it "returns http success on submission of login" do
      expect(response.body).to include("welcome Guest!")
      post login_path, :params => { username: "charming_snail", password: "password1" }
      expect(response).to redirect_to('/')
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to include("welcome charming_snail!")
    end
  end
end
