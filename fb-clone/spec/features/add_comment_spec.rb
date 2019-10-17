require 'rails_helper'

RSpec.feature 'AddComments', type: :feature do
  before :each do
    User.create(first_name: 'john',
                last_name: 'johnson',
                date_of_birth: '09/July/1967',
                gender: 'male',
                email: 'john@example.com',
                password: 'foobar')
  end

  scenario 'authenticated user creates Post and adds Comment' do
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

    find(:css, '#comment_content').set('This is my comment to this post')
    click_on 'Comment'

    expect(page).to have_content('Comment created')
    sleep(5)
  end
end
