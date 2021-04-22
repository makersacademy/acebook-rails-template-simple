# TDD API

Add dependencies to Gemfile for testing

Add rspec-rails to both the :development and :test groups.

```ruby
group :development, :test do
  gem 'rspec-rails'
end
```
- didn't work with rspec-rails 3.5.0
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
  
- Example of testing Like model
  
```ruby
require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
end
```

## Testing Controllers

- Create a `spec/requests` directory to house the specs for the controller testing.

- Create a `spec/factories` directory to contain the factories for the fake api requests.

- Run `touch spec/requests/{controller1_spec.rb, controller2_spec.rb, etc}`

- Run `touch spec/factories/{controller1.rb, controller2.rb, etc}`

- Define the content of each factory, here's an example:

```ruby 
# spec/factories/post.rb
FactoryBot.define do
  factory :post do
    content { Faker::Lorem.word }
    user_id { Faker::Number.number(10) }
  end
end
```

- Modify the request specs, example: 

```ruby
require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  
  let!(:users) {create_list(:user,10) } # creates the list of users
  let(:user_id) {users.first.id} # grabs the first one

  describe 'GET/users' do
    before { get '/users' }

    it 'returns users' do
      expect(json).not_to_be_empty # expects some response content
      expect(json.size).to eq(10) # 
    end
  end
end
```