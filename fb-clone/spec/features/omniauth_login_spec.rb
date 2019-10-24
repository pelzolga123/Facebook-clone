require 'rails_helper'
require 'helpers/omniauth_helper_spec'

RSpec.feature 'OmniauthLogins', type: :feature do


  context 'with valid credentials' do
    scenario 'Should successfully login user' do
      #mock_auth_hash
      visit user_session_path
      expect(page).to have_content('Sign in with Facebook')
      click_link 'Sign in with Facebook'

     # expect(page).to have_content('Log in to Facebook')
      fill_in 'email', with: 'pelzolga1234@gmail.com'
      #find(:css, 'input#email.iputtest._55r1._1kbt').set('pelzolga1234@gmail.com')
      fill_in 'pass', with: 'testingfacebook'
      #find(:css, 'input#pass.iputtest._55r1._1kbt').set('testingfacebook')
      find(:css, '._xkt #loginbutton').click
      #fill_in 'email', :with => 'pelzolga1234@gmail.com'
      #fill_in 'password', :with => 'testingfacebook'
      expect(page).to have_content('Successfully authenticated from Facebook account')
    end
  end


end
