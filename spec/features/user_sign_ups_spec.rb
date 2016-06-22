require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do
    scenario 'successfully' do
        visit '/users/sign_up'
        expect(page).to have_css('h2', text: 'Sign Up')
        fill_in 'First name', with: 'Ian'
        fill_in 'Last name', with: 'Roberts'
        fill_in 'Email', with: 'ianroberts131@gmail.com'
        fill_in('Password', with: "password", exact: true)
        fill_in('Password confirmation', with: 'password', exact: true)
        click_button 'Sign up'
        
        expect(page).to have_text "Welcome Ian!"
    end
    
end
