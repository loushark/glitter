require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before (:each) do
    post signup_path, :params => { :user => { username: "charming_snail", password: "password1" } }
  end

  describe "GET /new" do
    it 'returns http success on getting the new post form' do
      get "/posts/new"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST /posts" do
    it 'returns http success on submission of a new post' do
      post "/posts/", :params => { :post => { body: "oh hai there", user_id: 1 } }
      expect(response).to have_http_status(200)
      expect(response.body).to include("oh hai there")
    end
  end

  describe "DELETE /posts/:id" do
    it 'returns http success on deletion of a new post' do
      Post.create(body: "hello hello", user_id: 3)
      get '/'
      expect(response.body).to include("hello hello")
      delete "/posts/1"
      expect(response).to redirect_to('/')
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).not_to include("hello hello")
    end
  end
end
