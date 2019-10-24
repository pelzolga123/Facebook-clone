require 'rails_helper'
require 'support/omniauth_helper'

RSpec.feature 'OmniauthLogins', type: :feature do
  context 'with valid credentials' do
    scenario 'Should successfully login user' do
      visit user_session_path
      expect(page).to have_content('Sign in with Facebook')
      click_link 'Sign in with Facebook'
      expect(page).to have_content('Facebook')
    end
  end
end
