# AceBook

# Default users (remember to use .save after each entry)

user1 = User.new(name: "Tomas Garcia", email:"tom@gmail
.com", password: "1234")
user1.save

user2 = User.new(name: "Ezekiel Kassim", email:"ez@g
mail.com", password: "1234")
user2.save

post1 = Post.new(users_id: 1, content: "Just watched spiderman")
post1.save
post2 = Post.new(users_id: 2, content: "Time to code")
post2.save

comment1 = Comment.new(users_id: 2, posts_id: 1, content: "Batman was better")
comment1.save
comment2 = Comment.new(users_id: 1, posts_id: 1, content: "True, I agree")
comment2.save
comment3 = Comment.new(users_id: 2, posts_id: 1, content: "Thoughts on superman?")
comment3.save 
comment4 = Comment.new(users_id: 1, posts_id: 2, content: "What will you make?")
comment4.save
comment5 = Comment.new(users_id: 2, posts_id: 2, content: "The betterverse")
comment5.save
comment6 = Comment.new(users_id: 1, posts_id: 1, content: "Great film!")
comment6.save
comment7 = Comment.new(users_id: 1, posts_id: 2, content: "Sounds like fun!")
comment7.save

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
test