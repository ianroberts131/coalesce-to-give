require 'rails_helper'

RSpec.feature "Update User", type: :feature do
  
  scenario 'successfully' do
    user = create(:user)
    
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "password"
    click_button 'Log in'
    
    click_link 'Edit profile'
    
    expect(page).to have_css('h2', text: 'Edit Profile')
    fill_in 'First name', with: "New-name"
    click_button 'Update profile'
    
    expect(page).to have_text "New-name"
  end
  
end
