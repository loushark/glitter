require 'rails_helper'

RSpec.describe "Sessions", type: :request do
#   RSpec.describe "Sessions" do
#   it "signs user in and out" do
#     # user = create(:user)    ## uncomment if using FactoryBot
#     user = User.create(username: 'charming_snail', password: "password") ## uncomment if not using FactoryBot
#     sign_in user
#     get root_path
#     expect(response).to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
#
#     sign_out user
#     get root_path
#     expect(response).not_to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
#   end
# end


  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      user = User.create(username: 'charming_snail', password: "password")
      sign_in user
      post "/sessions/create"
      # get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /login" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /login" do
    it "returns http success" do
      # user = User.create(.......)
      # post login_path, params => {.....}

      expect(response).to redirect_to(:success)
       # expect(response.body).to include(“welcome hihi!")
    end
  end
end
