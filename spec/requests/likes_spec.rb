require 'rails_helper'

RSpec.describe "Likes", type: :request do

  before (:each) do
      post signup_path, :params => { :user => { username: "charming_snail", password: "password1" } }
      post "/posts/", :params => { :post => { body: "oh hai there", user_id: 1 } }
  end

  describe "POST /new" do
    it 'returns http success on submission of a like' do
      get'/'
      expect(response.body).to include("0 sparkles")
      post '/posts/1/likes'
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to include("1 sparkle")
    end
  end
end
