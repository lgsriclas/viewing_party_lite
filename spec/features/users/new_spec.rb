require 'rails_helper'

RSpec.describe 'new user registration page' do
  it 'has a form to register a new user' do
    visit '/register'

    expect(current_path).to eq('/register')
    expect(page).to have_content("Register a New User")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Email:")
  end

  it 'can register a new user' do
    name = "Charlie Brown"
    email = "charliebrown@snoopy.com"

    visit '/register'

    fill_in :name, with: name
    fill_in :email, with: email
    click_on :register
  end
end