# AceBook

## About Acebook
Acebook is an English online social media and social networking service owned by Tea and Scones Platforms.
Founded in 2021 by Lewis Jones, Stella Martin, Michelle Watkins, Hassan Saleem and Alex Wintle, its name comes as a play on words of the social media platform previously known as 'Facebook'.

As of November 2021, Acebook claimed 5 daily active users, and was ranked 1st in local internet usage. 
Acebook can be accessed from devices with Internet connectivity, such as personal computers, tablets and smartphones.
After registering, users can create a profile revealing information about themselves. They can post text and photos which are shared with any other users who have signed up.

## Setup

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

If you already have a database named ```pgapp_development```, you may need to run ```bin/rails db:drop```
before running the ```bin/rails db:create``` and ```bin/rails db:migrate``` to host Acebook locally.

## [Trello board](https://trello.com/b/Baoftn4e/acebook-tea-and-scones)

## [Miro Board](https://miro.com/app/board/o9J_lmYpz3c=/)

## [User Stories](USER-STORIES.md)
