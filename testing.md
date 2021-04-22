# TDD API

Add dependencies to Gemfile for testing

Add rspec-rails to both the :development and :test groups.

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end
```
Add factory_bot_rails, shoulda_matchers, faker and database_cleaner to the :test group.

```ruby
group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end
```

run `bundle install` to install gems.

Initialise rspec by running `rails generate rspec:install` which creates the spec folder and helpers.
Overwrite any duplicates.

## Updating rails helper with testing libraries

Link up Rspec and rails to use the Shoulda matchers
```ruby
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```

inside `RSpec.configure do |config|`


`config.include FactoryBot::Syntax::Methods`

## Setup Database Cleaner

- Add the following to rails_helper.rb

```ruby
require 'database_cleaner'

config.before(:suite) do
  DatabaseCleaner.clean_with(:truncation)
  DatabaseCleaner.strategy = :transaction
end

config.around(:each) do |example|
  DatabaseCleaner.cleaning do 
    example.run
  end
end
```

- Cleans the database before and after each testing suite.

## Testing models

- In spec/models/user_spec.rb:
- type: :model tells Rspec that this is a model spec

```ruby

```