require 'rails_helper'

RSpec.feature "Visit Welcome Page", type: :feature do
  scenario 'successfully' do
    visit '/'
    expect(page).to have_css 'h1', text: 'Coalesce to Give'
  end
end
