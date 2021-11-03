module SignUpHelper
  def sign_up
    visit('/welcome')
    click_button('Sign up')
    expect(page).to have_current_path('/users/new')
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_button('Create User')
  end
end