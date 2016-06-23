require 'rails_helper'

RSpec.feature "User Sign In", type: :feature do
  
  scenario 'successfully' do
    
    user = create(:user)
    
    visit '/users/sign_in'
    expect(page).to have_css('h2', text: 'Log in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "password"
    click_button 'Log in'
      
    expect(page).to have_text "Signed in successfully"
  end
    
end