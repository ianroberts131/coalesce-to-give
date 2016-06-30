require 'rails_helper'

RSpec.feature "Nonprofit Sign Up", type: :feature do
  scenario 'successfully' do
    
    visit '/users/sign_up'
    expect(page).to have_css('h2', text: 'Nonprofit Sign Up')
    
    within('.np-registration-form') do
      fill_in 'Organization Name', with: "Ian's Nonprofit"
      fill_in 'First name', with: 'Ian'
      fill_in 'Last name', with: 'Roberts'
      fill_in 'Email', with: 'ianroberts131@gmail.com'
      fill_in('Password', with: "password", exact: true)
      fill_in('Password confirmation', with: 'password', exact: true)
      click_button 'Sign up'
    end
      
    expect(page).to have_text "You have signed up successfully"
  end
end
