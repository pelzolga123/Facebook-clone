require 'rails_helper'

RSpec.feature 'Friendships', type: :feature do
  before :each do
    User.create(first_name: 'john',
                last_name: 'johnson',
                date_of_birth: '09/July/1967',
                gender: 'male',
                email: 'john@example.com',
                password: 'foobar')

    User.create(first_name: 'Anjola',
                last_name: 'Briggs',
                date_of_birth: '29/March/1983',
                gender: 'female',
                email: 'Abriggs@example.com',
                password: 'foobaz')
  end

  scenario 'accepting friendship' do
    visit user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'foobar'
    find(:css, '.btn-primary').click

    click_on 'Users'
    click_on 'Add friend'

    expect(page).to have_content('Waiting for response')

    click_on 'Sign out'

    fill_in 'Email', with: 'Abriggs@example.com'
    fill_in 'Password', with: 'foobaz'
    find(:css, '.btn-primary').click

    click_on 'Users'
    click_on 'Accept'
    expect(page).to have_content('Friends')
    # sleep(5)
  end
end
