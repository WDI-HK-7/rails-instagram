# Rails Basic Template (WDI HK 7)

### What is Gemfile?
- `Gemfile`: A file that defines Ruby libraries the app is using
- `bundle install`: Based on the Gemfile, install all the libraries
- *You should run bundle install every time you modify your Gemfile*
- A gem is a Ruby library
- RubyGems.org is a place to find and download Ruby gems (libraries)

### New Rails App

####Step 1: Create new Rails app
- `rails` is a Ruby library. We can use a command line to create the basic structure of a Rails application.
- In Terminal, `rails new <app_name> -BT`

####Step 2: Modify Gemfile
- Change the following in the **Gemfile**
```ruby
# Define Rails versions
gem 'rails', '4.2.1'
```

- Remove the following from the **Gemfile**
```ruby
# Use sqlite3 as the database for Development
gem 'sqlite3', group: :development
```

- Add the following to the **Gemfile**
```ruby
# Bootstrap
gem 'bootstrap-sass', '~> 3.3.0'

# Use postgresql as the database
gem 'pg'

# Debugging tools
gem 'better_errors'
gem 'binding_of_caller'
```

####Step 3: Bundle install
- In Terminal, `bundle install`
- This install all the necessary Ruby libraries for the Rails application

####Step 4: Postgres Database
- Download and Install: http://postgresapp.com/
- After installation, open `psql`
- Documentations can be found [Here](http://postgresguide.com/)

In psql, you need to create a user called `admin` with password `admin`

```psql
CREATE USER admin WITH PASSWORD 'admin';
```

In psql, you need to create a database called `development`

```psql
CREATE DATABASE development;
```

Now new database `development` is created. Now we will grant access to `admin`.

```psql
GRANT ALL PRIVILEGES ON DATABASE development to admin;
```

In **config/database.yml**, add the configurations of Postgres database

```ruby
default: &default
  adapter: postgresql
  database: development
  username: admin
  password: admin
  host: localhost
  port: 5432
  pool: 5
  timeout: 5000

development:
  <<: *default

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default

production:
  <<: *default
  database: db/production.sqlite3

```


####Step 5: Routes.rb
In Sublime, search for **"routes.rb"** under **config > routes.rb**

Add the following line:
```ruby
# get '/', to: 'controller_names#action_name'
# root 'controller_names#action_name'
root 'static_pages#index'
```

It means that when you visit the root path of the website `http://<domain_name.com>/`, it will go to the `static_pages` controller and find the action `index`

You can check if you have done this correctly `in the terminal` by typing `rake routes`

```
Prefix Verb URI Pattern Controller#Action
  root GET  /           static_pages#index
```

####Step 6: Controllers
Lets create a controller!

In iTerm, type
```
rails generate controller static_pages
```

You should be able to see that Rails have created all the important files/folders for you!

```
create  app/controllers/static_pages_controller.rb
invoke  erb
create    app/views/static_pages
invoke  helper
create    app/helpers/static_pages_helper.rb
invoke  assets
invoke    coffee
create      app/assets/javascripts/static_pages.js.coffee
invoke    scss
create      app/assets/stylesheets/static_pages.css.scss
```

####Step 7: Controller actions
In Sublime, search for **static_pages_controller.rb** under **app > controllers**

Add an **index action/method**
```ruby
class StaticPagesController < ApplicationController
  def index
  end
end

```

####Step 8: Views
Because we created an **index method** inside the controller, we need to created an html with the name **index.html.erb** under the folder with the same name as the controller
```
app > views > controller-name > method.html.erb
```

If we created **show method**, we need to created **show.html.erb**

In this file **index.html.erb**, add
``` html
<h1>Hello World!</h1>
```

####Step 9: Start a Rails server
Run the server!

In Terminal, run `rails server`, or simply `rails s`

In your browser, go to `http://localhost:3000`

WOW! You just created your first page in Rails!

####Step 10: Changing Styles / Adding Bootstrap
- Change `application.css` to `application.css.scss`
- Add the following line to the end of `application.css.scss`

```
@import "bootstrap-sprockets";
@import "bootstrap";
```

####Step 11: Deploy to Heroku
- In `config/production.rb`, change the following 

```
config.serve_static_assets = false
```

to 

```
config.serve_static_assets = true
```

- In Terminal, run `heroku create`
- Commit your changes
- Push code to Heroku with `git push heroku master`
- Open your app with `heroku open`
