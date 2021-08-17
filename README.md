# GLITTER

<img src="/glitter.png" width="700">

Based on the Makers Academy weekend challenge to build a twitter clone.

------

#### 💬 What can you do on Glitter?

Glitter is deployed on Heroku: https://glitter-rails.herokuapp.com/  
It is essentially a twitter clone where you interact with the webapp by making posts
  
  
here's some deets:  
- posts can be made upon sign up (keep it clean, folks!)
- don't worry! passwords created on sign up are encrypted using the bcrypt gem!
- your username and encrypted password is saved to a database via herouku which only i have access to - message me if you would like this deleted!
- posts can be deleted by the user who made the post  
- comments on posts cannot currently be deleted, but they will be deleted if the main post is deleted
- you can like or unlike a post by "adding glitter"  

-----

#### ⚙️  Tech stack
- Ruby on Rails
- PostgreSQL
- Javascript Ajax requests
- Rspec
- Capybara
- Heroku deployment


#### 🧪  How to run the test suite:

clone the repo to your local machine  
run bundle install in the command line to install dependencies  
run bundle exec rspec in the command line to run the rspec test suite  


----- 
#### 📝  Some things still left to do if i feel like getting around to it

[ ] create an unlike button which replaces the like button when a post is liked 
  (this would be better practice than to create an ajax request to rerender the text on the same button, due to the RESTful nature of the like requests)  
[ ] allow a user to delete their comments on posts  
[ ] create user profiles that view a users activity, and maybe a profile picture and about section  

--------
#### 💡  Some notes on what i learned during this project:
- **Performance issues with n+1**  
  In the terminal window upon loading the server and interacting with the webapp:  
  One query for loading the builds followed by N queries for loading the branch in each iteration.  
  This is fixed with eager loading using a .includes method to pre-load data:
  ````
  app/controllers/home_controller.rb
  @posts = Post.order(created_at: :desc).includes(comments: [:user])
  ````
- **.build in comments form**  
  this will build an instance of a model before submit.  
  When rendering the result, an extra empty element will be rendered, the render may need to be placed before the form OR a condition added to only render data that has persisted in the database, using an iteration that filters and finds only the persisted data :  
  ````
  <% post.comments.order(created_at: :desc).filter(&:persisted?).each do |comment| %>
    <div class="comments-div">
       <p class="comments-body"> <%= comment.message %></p>
       <p class="comments-user"> <%= comment.user.username %></p>
    </div>
  <% end %>
  ````

- **merge params in comments**  
  add in extra info to a params hash to access the username.  
  params saved from form are the message > return hash: { message: "stuff"}  
  add in user_id to the hash with .merge > returns { message: "stuff", user_id: <number> }  
  ````
  def create
    @post.comments.create(comment_params.merge(user_id: current_user.id))
       redirect_to root_url
  end
  ````
  now we can access both comment and username
  ````
  <p class="comments-body"> <%= comment.message %></p>
  <p class="comments-user"> <%= comment.user.username %></p>
  ````
    
- **dependencies on destroying data**  
  when deleting a post, the comments and likes need to be deleted along with it.  
  add a dependancy to destroy to the parent model
  ````
    Posts model:
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
  ````
    
    
  ----
#### 🔗 useful links:
- Authentication:  
  - [https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8](https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8)  
  - [https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836](https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836)  
- Liking and unliking:
  - https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2  
- Testing requests not controllers:  
  - https://medium.com/just-tech/rspec-controller-or-request-specs-d93ef563ef11
- Deploying webapp on heroku
   - https://devcenter.heroku.com/articles/getting-started-with-ruby#prepare-the-app
