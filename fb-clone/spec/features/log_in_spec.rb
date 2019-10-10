require 'rails_helper'

RSpec.feature 'LogIns', type: :feature do

  scenario 'valid inputs' do
    User.create!(email: 'john@example.com', password: 'foobar')
    visit user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'foobar'
    click_on 'Log in'

    expect(page).to have_content('Signed in successfully')
  end
end
