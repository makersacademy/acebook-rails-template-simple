
require 'rails_helper'


RSpec.feature 'Sign up page: ', type: :feature do
  create_post_input = '//*[@id="post_message"]'
  create_post_button = '//*[@id="submit"]'
  like_button = '/html/body/button[1]/a'
  unlike_button = '/html/body/div/article[1]/div[2]/div[2]/a[1]'


  before :each do
    visit '/'
  end

  scenario 'users can like post' do 
    sign_up
    visit '/posts'
    find(:xpath, create_post_input).set('this should work')
    find(:xpath, create_post_button).click
    find(:xpath, like_button).click
    expect(page).to have_content('1 Like')
  end

  scenario 'users can only like the post once' do
    sign_up
    visit '/posts'
    find(:xpath, create_post_input).set('this should work')
    find(:xpath, create_post_button).click
    find(:xpath, like_button).click
    find(:xpath, like_button).click
    expect(page).to have_content("You can't like more than once")
  end

  scenario 'users can unlike the post' do
    sign_up
    visit '/posts'
    find(:xpath, create_post_input).set('this should work')
    find(:xpath, create_post_button).click
    find(:xpath, like_button).click
    find(:xpath, like_button).click
    find(:xpath, unlike_button).click
    expect(page).to have_content("Like")

  end






end # end of test