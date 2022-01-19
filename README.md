# AceBook

# Default users (remember to use .save after each entry)
user1 = User.new(name: "Chris Clement", email:"c@gmail
.com", password: "1234")

user2 = User.new(name: "Mayo Theodore", email:"mayo@g
mail.com", password: "1234")

# Default posts
post1 = Post.new(users_id: 1, content: "Just watched s
piderman")

# Default comments
comment1 = Comment.new(users_id: 2, posts_id: 1, content: "Batman was better")
comment2 = Comment.new(users_id: 1, posts_id: 1, content: "True, I agree")


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

Rails requires a Javascript runtime to work. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again.
