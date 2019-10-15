require 'rails_helper'

RSpec.feature 'CreatePosts', type: :feature do
  before :each do
    User.create(first_name: 'john',
                last_name: 'johnson',
                date_of_birth: '09/July/1967',
                gender: 'male',
                email: 'john@example.com',
                password: 'foobar')
  end

  scenario 'authenticated user creates Post' do
    visit user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'foobar'
    find(:css, '.btn-primary').click

    expect(page).to have_content('Signed in successfully')
    find('button', text: 'New Post').click_link('New Post')
    fill_in 'Content', with: 'This is a test drive of the post as written by a user'
    click_on 'Post'
    expect(page).to have_content('Post was successfully created')
    expect(page).to have_content('This is a test drive of the post as written by a user')
  end

  scenario 'authenticated user tries to submit an empty post' do
    visit user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'foobar'
    find(:css, '.btn-primary').click

    expect(page).to have_content('Signed in successfully')
    find('button', text: 'New Post').click_link('New Post')
    fill_in 'Content', with: ' '
    click_on 'Post'
    expect(page).to have_content('Post can\'t be empty')
    expect(page).to have_content('post not created')
  end
end
