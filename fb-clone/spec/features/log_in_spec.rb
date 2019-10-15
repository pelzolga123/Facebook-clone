require 'rails_helper'

RSpec.feature 'LogIns', type: :feature do
  before :each do
    User.create(first_name: 'john',
                last_name: 'johnson',
                date_of_birth: '09/07/1967',
                gender: 'male',
                email: 'john@example.com',
                password: 'foobar')
  end
  scenario 'valid inputs' do
    visit user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'foobar'
    find(:css, '.btn-primary').click

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'invalid inputs' do
    visit user_session_path
    fill_in 'Email', with: nil
    fill_in 'Password', with: ' '
    find(:css, '.btn-primary').click

    expect(page).to have_content('Invalid Email or password')
  end
end
