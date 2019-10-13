require 'rails_helper'

RSpec.feature 'SignUps', type: :feature do

  before :each do
    User.create(first_name: 'john', last_name: 'johnson', date_of_birth: '09/August/1967', gender: 'male', email: 'john@example.com', password: 'foobar')
  end

  scenario 'valid inputs' do
    visit new_user_registration_path
    fill_in 'First name', with: 'john'
    fill_in 'Last name', with: 'johnson'
    fill_in 'Email', with: 'josefjohnson@yahoo.com'
    fill_in 'Password', with: 'foobar'
    fill_in 'Password confirmation', with: 'foobar'
    within('div.form-group div.form-row') do
      select('9', from: 'user_date_of_birth_3i')
      select('August', from: 'user_date_of_birth_2i')
      select('1967', from: 'user_date_of_birth_1i')
    end
    find(:css, '#user_gender_male').click
    find(:css, '.btn-primary').click
    sleep(2)
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'invalid inputs' do
    visit new_user_registration_path
    fill_in 'First name', with: 'john'
    fill_in 'Last name', with: 'johnson'
    fill_in 'Email', with: nil
    fill_in 'Password', with: 'foobar'
    fill_in 'Password confirmation', with: 'foobar'
    within('div.form-group div.form-row') do
      select('9', from: 'user_date_of_birth_3i')
      select('August', from: 'user_date_of_birth_2i')
      select('1967', from: 'user_date_of_birth_1i')
    end
    find(:css, '#user_gender_male').click
    find(:css, '.btn-primary').click
    sleep(2)
    expect(page).to have_content('Email can\'t be blank')
  end
end
