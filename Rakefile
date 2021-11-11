# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :seed do 
  p "adding users" 
  user = User.create(first_name: "Joe",
    last_name: "Bloggs",
    date_of_birth: "1985-03-14",
    email: "jbloggs@gmail.com",
    password_digest: "hashed_password")
end



