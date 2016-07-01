require 'rails_helper'

RSpec.feature "Update Nonprofits", type: :feature do
  scenario 'successfully' do
  
  visit '/users/sign_up'
  
  within('.np-registration-form') do
    fill_in 'Organization Name', with: "Ian's Nonprofit"
    fill_in 'First name', with: 'Ian'
    fill_in 'Last name', with: 'Roberts'
    fill_in 'Email', with: 'ianroberts131@gmail.com'
    fill_in('Password', with: "password", exact: true)
    fill_in('Password confirmation', with: 'password', exact: true)
    click_button 'Sign up'
  end
  
  select "Ian's Nonprofit", from: "My Nonprofits"
  expect(page).to have_text "Edit Nonprofit"
  fill_in 'Name', with: "New Nonprofit"
  fill_in 'Email', with: "new_nonprofit@email.com"
  fill_in 'Website', with: "http://www.new_nonprofit.com"
  fill_in 'Phone', with: "444-444-4444"
  click_button 'Update Nonprofit'
  
  expect(page).to have_css('h2', text: 'New Nonprofit')
  expect(page).to have_text("new_nonprofit@email.com")
  expect(page).to have_text("http://www.new_nonprofit.com")
  expect(page).to have_text("444-444-4444")
    
  end
end
