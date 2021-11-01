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

## Trello board
https://trello.com/b/Baoftn4e/acebook-tea-and-scones

## User stories
### MVP
```
As a User,
So that I can use Acebook, 
I want to be able to sign up.
```
```
As a User, 
So that I can access my Acebook account,
I want to be able to sign in.
```
```
As a User,
So that I can keep my account secure,
I want to be able to sign out.
```
```
As a User,
So that I can share my opinions,
I want to be able to submit a text post.
```
```
As a User,
So that I can view recent posts,
I want to see the newest posts first.
```
### Nice to haves
```
As a User,
So that I know I am logged in, 
I want to be able to see my username in the browser.
```
```
As a User,
So that I can share my opinions on other posts,
I want to be able to comment on a post.
```
```
As a User,
So that I can react to a post,
I want to be able to like a post.
```
```
As a User,
So that I can see if a post is popular,
I want to be able to see the number of likes it has next to the post.
```
```
As a User,
So that others can identify my posts,
I want my photo and name to appear next to all of my posts.
```
```
As a User,
So that I can quickly access other areas of the site,
I want to be able to use a navigation bar.
```
```
As a User,
So that I can share my images,
I want to be able to upload a photo.
```
```
As a User,
So that Acebook looks nice,
I want there to be a user interface.
```
```
As a team member,
So that I can host my site,
I want to run Acebook on Heroku.
```
```
As a User,
So that I can connect with my friends,
I want to be able to send a friend request.
```
