require 'rails_helper'

RSpec.feature 'LogIns', type: :feature do
  scenario 'valid inputs' do
    User.create!(first_name: 'john',
                 last_name: 'johnson',
                 date_of_birth: '09/07/1967',
                 gender: 'male',
                 email: 'john@example.com',
                 password: 'foobar')
    visit user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'foobar'
    find(:css, '.btn-primary').click

    expect(page).to have_content('Signed in successfully')
  end
end
