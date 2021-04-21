# AceBook

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:

```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```

Rails requires a Javascript runtime to work. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again


# Setting up the Ruby-on-rails back end

- Firstly jump in the gemfile and set the ruby version to `3.0.1`

## Database

- We create a new rails setup which is dedicated to be an API and adds the database as PostgreSQL `rails new [backend-app-name] --api -T --database=postgresql`

- To create our database and tables, firstly the user table: 
`bin/rails generate model User forename:string surname:string username:string email:string password:string profilePic:string`

- The posts table, instantizes with the reference to user as one of its columns`bin/rails generate model Post content:string user:references`

- The likes table was created with the columns referencing post and users:
`bin/rails generate model Like user:references post:references`

- When rails is initialized the database names are named with suffixes of production, test and development. These can be found and changed in the `database.yml` in the `config` folder.

- Inside the user model we added the line `has_many :likes, :posts` to define the relationship with these tables

- Once these are set up we can run `bin/rails db:create` followed by `bin/rails db:migrate`

- Use your favourite PostgreSQL interrogation service to access the databases and verify their structure

- You can use rails console via `bin/rails c`:

```
acebook-insert-team-name-here git:(rails-api) ✗ bin/rails c  
Running via Spring preloader in process 22382  
Loading development environment (Rails 6.1.3.1)  
2.6.6 :001 > user = User.new  
=> #<User id: nil, forename: nil, surname: nil, username: nil, email: nil, password: nil, profilePic: nil, created_at: nil, updated_at: nil>  
2.6.6 :002 > user.save  
TRANSACTION (0.4ms) BEGIN  
User Create (4.6ms) INSERT INTO “users” (“created_at”, “updated_at”) VALUES ($1, $2) RETURNING “id” [[“created_at”, “2021-04-21 13:45:27.310037"], [“updated_at”, “2021-04-21 13:45:27.310037"]]  
TRANSACTION (2.0ms) COMMIT  
=> true  
2.6.6 :003 > post = post.new  
Traceback (most recent call last):  
1: from (irb):3  
NoMethodError (undefined method `new’ for nil:NilClass)  
2.6.6 :004 > post = Post.new  
=> #<Post id: nil, content: nil, user_id: nil, created_at: nil, updated_at: nil>  
2.6.6 :007 > post = Post.new(content: “Hi”, user_id: 1)  
=> #<Post id: nil, content: “Hi”, user_id: 1, created_at: nil, updated_at: nil>  
2.6.6 :008 > post.save  
TRANSACTION (0.7ms) BEGIN  
User Load (0.5ms) SELECT “users”.* FROM “users” WHERE “users”.“id” = $1 LIMIT $2 [[“id”, 1], [“LIMIT”, 1]]  
Post Create (2.3ms) INSERT INTO “posts” (“content”, “user_id”, “created_at”, “updated_at”) VALUES ($1, $2, $3, $4) RETURNING “id” [[“content”, “Hi”], [“user_id”, 1], [“created_at”, “2021-04-21 13:47:42.029162"], [“updated_at”, “2021-04-21 13:47:42.029162"]]  
TRANSACTION (0.4ms) COMMIT  
=> true  
2.6.6 :009 > like = Like.new(post_id: 1, user_id: 1)  
=> #<Like id: nil, user_id: 1, post_id: 1, created_at: nil, updated_at: nil>  
2.6.6 :010 > like.save  
TRANSACTION (0.2ms) BEGIN  
User Load (0.4ms) SELECT “users”.* FROM “users” WHERE “users”.“id” = $1 LIMIT $2 [[“id”, 1], [“LIMIT”, 1]]  
Post Load (2.8ms) SELECT “posts”.* FROM “posts” WHERE “posts”.“id” = $1 LIMIT $2 [[“id”, 1], [“LIMIT”, 1]]  
Like Create (6.6ms) INSERT INTO “likes” (“user_id”, “post_id”, “created_at”, “updated_at”) VALUES ($1, $2, $3, $4) RETURNING “id” [[“user_id”, 1], [“post_id”, 1], [“created_at”, “2021-04-21 13:48:19.684134"], [“updated_at”, “2021-04-21 13:48:19.684134"]]  
TRANSACTION (0.5ms) COMMIT  
=> true  
2.6.6 :011 > Post.new(content: “Different”, user_id: 1).save  
TRANSACTION (0.2ms) BEGIN  
User Load (0.5ms) SELECT “users”.* FROM “users” WHERE “users”.“id” = $1 LIMIT $2 [[“id”, 1], [“LIMIT”, 1]]  
Post Create (0.5ms) INSERT INTO “posts” (“content”, “user_id”, “created_at”, “updated_at”) VALUES ($1, $2, $3, $4) RETURNING “id” [[“content”, “Different”], [“user_id”, 1], [“created_at”, “2021-04-21 13:48:51.524365"], [“updated_at”, “2021-04-21 13:48:51.524365"]]  
TRANSACTION (0.3ms) COMMIT  
=> true  
2.6.6 :012 > post.find(1)  
Traceback (most recent call last):  
1: from (irb):12  
NoMethodError (undefined method `find’ for #<Post:0x00007fb2f906c850>)  
2.6.6 :013 > Post.find(1)  
Post Load (0.5ms) SELECT “posts”.* FROM “posts” WHERE “posts”.“id” = $1 LIMIT $2 [[“id”, 1], [“LIMIT”, 1]]  
=> #<Post id: 1, content: “Hi”, user_id: 1, created_at: “2021-04-21 13:47:42.029162000 +0000", updated_at: “2021-04-21 13:47:42.029162000 +0000”>  
2.6.6 :014 > User.find(1)  
User Load (0.6ms) SELECT “users”.* FROM “users” WHERE “users”.“id” = $1 LIMIT $2 [[“id”, 1], [“LIMIT”, 1]]  
=> #<User id: 1, forename: nil, surname: nil, username: nil, email: nil, password: nil, profilePic: nil, created_at: “2021-04-21 13:45:27.310037000 +0000", updated_at: “2021-04-21 13:45:27.310037000 +0000”>  
2.6.6 :015 > Like.find(1)  
Like Load (0.5ms) SELECT “likes”.* FROM “likes” WHERE “likes”.“id” = $1 LIMIT $2 [[“id”, 1], [“LIMIT”, 1]]  
=> #<Like id: 1, user_id: 1, post_id: 1, created_at: “2021-04-21 13:48:19.684134000 +0000", updated_at: “2021-04-21 13:48:19.684134000 +0000”>
```

## Cross-Origin Resource Sharing

- Rails sets up the gemfile automatically, but comments out gemfiles that not everyone is going to need, we need to uncomment the gemfile `cors`
- the run `bundle`

### Active Mode Serializers

- Limit the data that is returned on a request to the API, add `gem 'active_mode_serializers', '~>0.10.0'` and run `bundle`

- Create serializers with the command `bin/rails g serializer user` and do so for each of the tables, user, posts and like. They have to be the singular versions of the names. 

- Within the `app/serializers` folder you will find the files, enter the aspects of the tables that you want to be able to return when you recieve API requests, for example:

```
class UserSerializer < ActiveModel::Serializer
  attributes :id, :forename, :surname, :username, :email, :password, :profilePic
end
```

- 