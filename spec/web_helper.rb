def sign_up_john_wick
  visit('/')
  fill_in('First Name', with: 'John')
  fill_in('Last Name', with: 'Wick')
  fill_in('Your Email', with: 'kissmygun@test.com')
  fill_in('Password', with: 'test')
  check('terms')
  click_button('Sign Up!')
end
