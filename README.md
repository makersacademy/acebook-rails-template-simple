# AceBook

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
