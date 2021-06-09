require 'rails_helper'

RSpec.describe "Comments", type: :request do

  before (:each) do
      post signup_path, :params => { :user => { username: "charming_snail", password: "password1" } }
      post "/posts/", :params => { :post => { body: "oh hai there", user_id: 1 } }
  end

  describe "POST /new" do
      it 'returns http success on submission of a comment' do
      post '/posts/1/comments', :params => { :comment => { message: "youre really cool", user_id: 1 } }
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to include("youre really cool")
    end
  end
end
